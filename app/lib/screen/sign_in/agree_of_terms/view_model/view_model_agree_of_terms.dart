//
// zzekak_client all rights reserved
//
// @author WongueShin
// @email won7963kr@gmail.com
// @since 2024-08-18
//

import 'package:bloc/bloc.dart';
import 'package:zzekak/screen/sign_in/agree_of_terms/view_model/event.dart';
import 'package:zzekak/screen/sign_in/agree_of_terms/view_model/state.dart';

final class ViewModelOfAgreeOfTerms
    extends Bloc<AgreeOfTermsEvent, AgreeOfTermsState> {
  ViewModelOfAgreeOfTerms(super.initialState) {
    on<AgreeOfTermsEvent>((event, emit) {});
  }
}
