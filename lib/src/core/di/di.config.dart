// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../../exports_main.dart' as _i753;
import '../../data/data_sources/auth_remote_data_source.dart' as _i641;
import '../../data/entity/shared_pref_entity.dart' as _i11;
import '../../data/repositories/auth_repository.dart' as _i481;
import '../utils/app_urls.dart' as _i1060;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i11.SharedPreferencesEntity>(
        () => _i11.SharedPreferencesEntity());
    gh.lazySingleton<_i1060.AppUrls>(() => _i1060.AppUrlsImpl());
    gh.lazySingleton<_i641.AuthRemoteDataSource>(
        () => _i641.AuthRemoteDataSourceImpl(
              appUrls: gh<_i753.AppUrls>(),
              sharedPreferencesEntity: gh<_i753.SharedPreferencesEntity>(),
            ));
    gh.lazySingleton<_i481.AuthRepository>(() => _i481.AuthRepositoryImpl(
        authDataSource: gh<_i641.AuthRemoteDataSource>()));
    return this;
  }
}
