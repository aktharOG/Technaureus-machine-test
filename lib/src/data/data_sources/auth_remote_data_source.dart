import 'dart:convert';
import 'dart:developer';
import 'package:adhoc/exports_main.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

abstract class AuthRemoteDataSource {
  /// Logs in the user with the provided mobile number and country code, using OTP verification.
  ///
  /// Returns a [Future] that completes with an [Either] object containing either a [Failure] or a [int].
  /// The [Failure] object represents any error that occurred during the login process.
  /// The [int] value represents the OTP if the login is successful.
  ///
  /// Parameters:
  /// - [countryCode]: The country code of the user's mobile number.
  /// - [mobileNumber]: The user's mobile number.
  ///
  /// Usage:
  /// ```dart
  /// final result = await loginWithMobile(countryCode: '966', mobileNumber: '123456789');
  /// result.fold(
  ///   (failure) => print('Login failed: $failure'),
  ///   (otp) => print('Login successful. OTP: $jsonDecode(otp)['otp']'),
  /// );
  /// ```
  Future<Either<Failure, int>> loginWithUsername({
    required String username,
    required String password,
  });
}

@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final AppUrls _appUrls;
  final SharedPreferencesEntity _sharedPreferencesEntity;

  AuthRemoteDataSourceImpl({
    required AppUrls appUrls,
    required SharedPreferencesEntity sharedPreferencesEntity,
  })  : _appUrls = appUrls,
        _sharedPreferencesEntity = sharedPreferencesEntity;
  @override
  Future<Either<Failure, int>> loginWithUsername({
    required String username,
    required String password,
  }) async {
    final client = http.Client();

    try {
      final url = Uri.http(EnvLoader.get('BASE_URL'), _appUrls.login);
      // final lang = await _sharedPreferencesEntity.getAppLocale();
      log('mobile number is $username  body : $username $password',
          name: 'AuthDataSourceImpl');
      log("url : $url");

      final data = jsonEncode({
        'username': username,
        'password': password,
      });

      final response = await client.post(
        url,
        body: data,
        headers: {
          "Accesskey": EnvLoader.get('API_KEY'),
          "Content-Type": "application/x-www-form-urlencoded",
          //   "lan": '$lang',
        },
      );
      log(
        'Response: ${response.body} ---${response.statusCode}',
        name: 'AuthDataSourceImpl',
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _sharedPreferencesEntity.setToken(data['token']);

        log("res : $data");

        return Right(int.parse('${data['customer_id']}'));
      } else {
        log("errror res : ${response.body}");
        return Left(
          handleStatusCode(
            response.statusCode,
            '${jsonDecode(response.body)['data']}',
          ),
        );
      }
    } catch (e) {
      return Left(handleException(e));
    } finally {
      log('Closing http client', name: 'AuthDataSourceImpl');
      client.close();
    }
  }
}
