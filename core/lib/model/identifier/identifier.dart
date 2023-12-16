//
// zzekak_client all rights reserved
//
// @author WongueShin
// @email won7963kr@gmail.com
// @since 2023-12-09
//

/// 엔티티를 식별할 수 있는 고유한 값을 의미합니다.
final class Identifier {
  final String _identificationId;

  const Identifier(this._identificationId);

  @override
  bool operator ==(Object other) {
    if (other is! Identifier) return false;
    return _identificationId == other._identificationId;
  }

  @override
  int get hashCode => _identificationId.hashCode;

  @override
  String toString() => "Identifier: $_identificationId";
}
