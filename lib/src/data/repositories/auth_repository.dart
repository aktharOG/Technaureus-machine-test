import 'package:adhoc/src/core/utils/error_handler.dart';
import 'package:adhoc/src/data/data_sources/auth_remote_data_source.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

abstract class AuthRepository {
  Future<Either<Failure, int>> loginWithMobile({
    required String countryCode,
    required String mobileNumber,
  });
}

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _authDataSource;
  AuthRepositoryImpl({required AuthRemoteDataSource authDataSource})
      : _authDataSource = authDataSource;
  @override
  Future<Either<Failure, int>> loginWithMobile({
    required String countryCode,
    required String mobileNumber,
  }) async {
    return _authDataSource.loginWithMobile(
      countryCode: countryCode,
      mobileNumber: mobileNumber,
    );
  }
}
