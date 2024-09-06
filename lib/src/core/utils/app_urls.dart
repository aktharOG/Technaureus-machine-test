import 'package:injectable/injectable.dart';

abstract class AppUrls {
  String get basePath;

  String get sendOtp;
}

@LazySingleton(as: AppUrls)
class AppUrlsImpl implements AppUrls {
  @override
  String get basePath => '/api';

  @override
  String get sendOtp => '$basePath/sendotp/';
}
