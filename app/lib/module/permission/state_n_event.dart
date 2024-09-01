//
// zzekak_client all rights reserved
//
// @author WongueShin
// @email won7963kr@gmail.com
// @since 2024-08-18
//

import 'package:dart_scope_functions/dart_scope_functions.dart';
import 'package:permission_handler/permission_handler.dart';

// wrapper class
sealed class ZzekakPermission {
  const ZzekakPermission();
}

/// [Permission.location] 에 대응하는 class
final class ZzekakLocationPermission extends ZzekakPermission {
  const ZzekakLocationPermission();
}

/// [Permission.locationWhenInUse] 에 대응하는 class
final class ZzekakLocationWhenInUsePermission extends ZzekakPermission {
  const ZzekakLocationWhenInUsePermission();
}

/// [Permission.locationAlways] 에 대응하는 class
final class ZzekakLocationAlwaysPermission extends ZzekakPermission {
  const ZzekakLocationAlwaysPermission();
}

/// [Permission.calendarFullAccess] 에 대응하는 class
final class ZzekakCalendarPermission extends ZzekakPermission {
  const ZzekakCalendarPermission();
}

typedef ZzekakPermissionAllotment<T extends ZzekakPermission> = ({
  T permission,
  bool status,
});

final class PermissionState {
  /// [Permission.location] 에 대응하는 allotment
  final ZzekakPermissionAllotment<ZzekakLocationPermission>? locationAllotment;

  /// [Permission.locationWhenInUse] 에 대응하는 allotment
  final ZzekakPermissionAllotment<ZzekakLocationWhenInUsePermission>?
      locationWhenInUseAllotment;

  /// [Permission.locationAlways] 에 대응하는 allotment
  final ZzekakPermissionAllotment<ZzekakLocationAlwaysPermission>?
      locationAlwaysAllotment;

  /// [Permission.calendarFullAccess] 에 대응하는 allotment
  final ZzekakPermissionAllotment<ZzekakCalendarPermission>? calendarAllotment;

  PermissionState({
    bool? isLocationGranted,
    bool? isLocationWhenInUseGranted,
    bool? isLocationAlwaysGranted,
    bool? isCalendarGranted,
  })  : locationAllotment = isLocationGranted?.let((final bool it) => (
              permission: const ZzekakLocationPermission(),
              status: it,
            )),
        locationWhenInUseAllotment = isLocationWhenInUseGranted?.let(
            (final bool it) => (
                  permission: const ZzekakLocationWhenInUsePermission(),
                  status: it
                )),
        locationAlwaysAllotment =
            isLocationAlwaysGranted?.let((final bool it) => (
                  permission: const ZzekakLocationAlwaysPermission(),
                  status: it,
                )),
        calendarAllotment = isCalendarGranted?.let((final bool it) => (
              permission: const ZzekakCalendarPermission(),
              status: it,
            ));

  PermissionState copyWith({
    bool? isLocationGranted,
    bool? isLocationWhenInUseGranted,
    bool? isLocationAlwaysGranted,
    bool? isCalendarGranted,
  }) =>
      PermissionState(
        isLocationGranted: isLocationGranted ?? locationAllotment?.status,
        isLocationWhenInUseGranted:
            isLocationWhenInUseGranted ?? locationWhenInUseAllotment?.status,
        isLocationAlwaysGranted:
            isLocationAlwaysGranted ?? locationAlwaysAllotment?.status,
        isCalendarGranted: isCalendarGranted ?? calendarAllotment?.status,
      );
}

sealed class PermissionEvent {
  const PermissionEvent();
}

/// [PermissionService] 를 초기화하는 event
final class WhenInitializePermissionService extends PermissionEvent {
  const WhenInitializePermissionService();
}

/// 특정 권한이 요청되었을 때의 event
final class WhenPermissionRequested extends PermissionEvent {
  final ZzekakPermission permission;

  const WhenPermissionRequested({
    required this.permission,
  });
}

/// 특정 권한이 거부되었을 때의 event
final class WhenPermissionDenied extends PermissionEvent {
  final ZzekakPermission permission;

  const WhenPermissionDenied({
    required this.permission,
  });
}
