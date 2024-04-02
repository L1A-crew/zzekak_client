//
// zzekak_client all rights reserved
//
// @author WongueShin
// @email won7963kr@gmail.com
// @since 2024-03-19
//

import 'package:core/exception/error_code_book.dart';
import 'package:core/exception/server_io_exception.dart';
import 'package:core/model/auth_token/auth_token.dart';
import 'package:meta/meta.dart';

@protected
extension AuthRetryExtension<T> on Future<T> {
  Future<T> manageAuthenticate(
      final Future<FirstPartyAuthToken> Function()
          tokenProvidingCallback) async {
    try {
      return await this;
    } catch (e) {
      for (int i = 0; i < 10; i++) {
        if (e is ServerIOException && e.errorCode == IOErrorCode.UNAUTHORIZED) {
          try {
            await tokenProvidingCallback().then((value) => null);
          } catch (_) {}
          break;
        }
        return await this;
      }
      rethrow;
    }
  }
}
