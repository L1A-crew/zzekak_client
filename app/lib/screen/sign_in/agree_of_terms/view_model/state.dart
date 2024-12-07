//
// zzekak_client all rights reserved
//
// @author WongueShin
// @email won7963kr@gmail.com
// @since 2024-08-18
//

final class AgreeOfTermsState {
  final bool isOverFourteen;
  final bool isAgreeOfServiceTerms;
  final bool isAgreeOfPrivacyPolicy;
  final bool marketingAgreement;
  final bool isLocationAgreement;
  final bool isPushAgreement;

  bool get isRequiredAgreeOfTerms =>
      isOverFourteen &&
      isAgreeOfServiceTerms &&
      isAgreeOfPrivacyPolicy &&
      marketingAgreement;

  const AgreeOfTermsState({
    this.isOverFourteen = false,
    this.isAgreeOfServiceTerms = false,
    this.isAgreeOfPrivacyPolicy = false,
    this.marketingAgreement = false,
    this.isLocationAgreement = false,
    this.isPushAgreement = false,
  });

  AgreeOfTermsState copyWith({
    bool? isOverFourteen,
    bool? isAgreeOfServiceTerms,
    bool? isAgreeOfPrivacyPolicy,
    bool? marketingAgreement,
    bool? isLocationAgreement,
    bool? isPushAgreement,
  }) {
    return AgreeOfTermsState(
      isOverFourteen: isOverFourteen ?? this.isOverFourteen,
      isAgreeOfServiceTerms: isAgreeOfServiceTerms ?? this.isAgreeOfServiceTerms,
      isAgreeOfPrivacyPolicy: isAgreeOfPrivacyPolicy ?? this.isAgreeOfPrivacyPolicy,
      marketingAgreement: marketingAgreement ?? this.marketingAgreement,
      isLocationAgreement: isLocationAgreement ?? this.isLocationAgreement,
      isPushAgreement: isPushAgreement ?? this.isPushAgreement,
    );
  }
}
