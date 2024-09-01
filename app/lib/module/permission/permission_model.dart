//
// zzekak_client all rights reserved
//
// @author WongueShin
// @email won7963kr@gmail.com
// @since 2024-08-18
//

import 'package:bloc/bloc.dart';
import 'package:dart_scope_functions/dart_scope_functions.dart';
import 'package:flutter/foundation.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:zzekak/module/permission/state_n_event.dart';

final PermissionState _initialPermissionState = PermissionState();

/// [Permission.location.onGranted] 같은거 subscribe 해야함.
final class PermissionModel extends Bloc<PermissionEvent, PermissionState> {
  @visibleForTesting
  PermissionModel(super.initialState) {
    on<PermissionEvent>((final PermissionEvent event,
        final Emitter<PermissionState> emit) async {
      switch (event) {
        case WhenInitializePermissionService():
          await _onInitializePermission(event, emit);
        case WhenPermissionRequested():
          await _onWhenPermissionGranted(event, emit);
        case WhenPermissionDenied():
          await _onWhenPermissionDenied(event, emit);
      }
    });

    _permissionCallbackResist();
  }

  Future<void> _onInitializePermission(
    final WhenInitializePermissionService event,
    final Emitter<PermissionState> emitter,
  ) async {
    // prevent waterfall
    (await ([
      Permission.location.isGranted,
      Permission.locationWhenInUse.isGranted,
      Permission.locationAlways.isGranted,
      Permission.calendarFullAccess.isGranted,
    ].wait))
        .let((final List<bool> res) => PermissionState(
              isLocationGranted: res[0],
              isLocationWhenInUseGranted: res[1],
              isLocationAlwaysGranted: res[2],
              isCalendarGranted: res[3],
            ))
        .also((it) => emitter(it));
  }

  Future<void> _onWhenPermissionGranted(
    final WhenPermissionRequested event,
    final Emitter<PermissionState> emitter,
  ) async {
    event.permission.let((it) async {
      switch (it) {
        case ZzekakLocationPermission():
          emitter(state.copyWith(
            isLocationGranted: (await Permission.location.request()).isGranted,
          ));
        case ZzekakLocationWhenInUsePermission():
          emitter(state.copyWith(
            isLocationWhenInUseGranted:
                (await Permission.locationWhenInUse.request()).isGranted,
          ));
        case ZzekakLocationAlwaysPermission():
          emitter(state.copyWith(
            isLocationAlwaysGranted:
                (await Permission.locationAlways.request()).isGranted,
          ));
        case ZzekakCalendarPermission():
          emitter(state.copyWith(
            isCalendarGranted:
                (await Permission.calendarFullAccess.request()).isGranted,
          ));
      }
    });
  }

  Future<void> _onWhenPermissionDenied(
    final WhenPermissionDenied event,
    final Emitter<PermissionState> emit,
  ) async {
    event.permission.let((it) async {
      switch (it) {
        case ZzekakLocationPermission():
          emit(state.copyWith(isLocationGranted: false));
        case ZzekakLocationWhenInUsePermission():
          emit(state.copyWith(isLocationWhenInUseGranted: false));
        case ZzekakLocationAlwaysPermission():
          emit(state.copyWith(isLocationAlwaysGranted: false));
        case ZzekakCalendarPermission():
          emit(state.copyWith(isCalendarGranted: false));
      }
    });
  }

  factory PermissionModel.newInstance() =>
      PermissionModel(_initialPermissionState);

  void _permissionCallbackResist() {
    Permission.location.onDeniedCallback(() => add(
        const WhenPermissionDenied(permission: ZzekakLocationPermission())));
    Permission.locationWhenInUse.onDeniedCallback(() => add(
        const WhenPermissionDenied(
            permission: ZzekakLocationWhenInUsePermission())));
    Permission.locationAlways.onDeniedCallback(() => add(
        const WhenPermissionDenied(
            permission: ZzekakLocationAlwaysPermission())));
    Permission.calendarFullAccess.onDeniedCallback(() => add(
        const WhenPermissionDenied(permission: ZzekakCalendarPermission())));
  }
}
