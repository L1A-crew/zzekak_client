//
// zzekak_client all rights reserved
//
// @author WongueShin
// @email won7963kr@gmail.com
// @since 2024-08-18
//

import 'package:bloc/bloc.dart';
import 'package:zzekak/screen/sign_in/agree_of_terms/view_model/state.dart';

final class ViewModelOfAgreeOfTerms extends Cubit<AgreeOfTermsState> {
  ViewModelOfAgreeOfTerms(super.initialState);

  void changeIsOverFourteen(bool isOverFourteen) {
    emit(state.copyWith(isOverFourteen: isOverFourteen));
  }

  void changeIsAgreeOfServiceTerms(bool isAgreeOfServiceTerms) {
    emit(state.copyWith(isAgreeOfServiceTerms: isAgreeOfServiceTerms));
  }

  void changeIsAgreeOfPrivacyPolicy(bool isAgreeOfPrivacyPolicy) {
    emit(state.copyWith(isAgreeOfPrivacyPolicy: isAgreeOfPrivacyPolicy));
  }

  void changeMarketingAgreement(bool marketingAgreement) {
    emit(state.copyWith(marketingAgreement: marketingAgreement));
  }

  void changeIsLocationAgreement(bool isLocationAgreement) {
    emit(state.copyWith(isLocationAgreement: isLocationAgreement));
  }

  void changeIsPushAgreement(bool isPushAgreement) {
    emit(state.copyWith(isPushAgreement: isPushAgreement));
  }

  void changeAllAgreeOfTerms(bool isAgree) {
    emit(state.copyWith(
      isOverFourteen: isAgree,
      isAgreeOfServiceTerms: isAgree,
      isAgreeOfPrivacyPolicy: isAgree,
      marketingAgreement: isAgree,
      isLocationAgreement: isAgree,
      isPushAgreement: isAgree,
    ));
  }
}
