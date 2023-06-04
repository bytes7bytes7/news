// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i6;
import 'package:flutter/material.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:mapster/mapster.dart' as _i9;

import '../../../features/common/application/application.dart' as _i3;
import '../../../features/common/application/blocs/article/article_bloc.dart'
    as _i18;
import '../../../features/common/domain/repositories/news_repository.dart'
    as _i11;
import '../../../features/common/domain/services/news_service.dart' as _i13;
import '../../../features/common/domain/services/services.dart' as _i21;
import '../../../features/common/infrastructure/data_providers/news_data_provider.dart'
    as _i10;
import '../../../features/common/infrastructure/providers/beautified_date_time_provider.dart'
    as _i4;
import '../../../features/common/infrastructure/repositories/news_repository.dart'
    as _i12;
import '../../../features/common/infrastructure/third_party/hive_registrar.dart'
    as _i5;
import '../../../features/common/infrastructure/third_party/mapster_registrar.dart'
    as _i19;
import '../../../features/news/application/blocs/all_news/all_news_bloc.dart'
    as _i22;
import '../../../features/news/application/blocs/top_news/top_news_bloc.dart'
    as _i20;
import '../../../features/news/application/coordinators/all_news_coordinator.dart'
    as _i16;
import '../../../features/news/application/coordinators/top_news_coordinator.dart'
    as _i14;
import '../coordinators/all_news_coordinator.dart' as _i17;
import '../coordinators/top_news_coordinator.dart' as _i15;
import '../router.dart' as _i23;
import '../third_party/dio_module.dart' as _i24;
import '../third_party/hive_module.dart' as _i8;
import '../third_party/mapster_module.dart' as _i25;

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// initializes the registration of main-scope dependencies inside of GetIt
Future<_i1.GetIt> init(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final dioModule = _$DioModule();
  final routerModule = _$RouterModule();
  final mapsterModule = _$MapsterModule();
  gh.singleton<_i3.BeautifiedDateTimeProvider>(
      _i4.ProdBeautifiedDateTimeProvider());
  gh.singleton<_i5.CommonHiveRegistrar>(_i5.CommonHiveRegistrar()..register());
  gh.singleton<_i6.Dio>(dioModule.dio);
  gh.singleton<_i7.GlobalKey<_i7.NavigatorState>>(routerModule.rootKey);
  await gh.singletonAsync<_i8.HiveModule>(
    () {
      final i = _i8.HiveModule();
      return i.init().then((_) => i);
    },
    preResolve: true,
  );
  gh.singleton<_i9.Mapster>(mapsterModule.mapster);
  gh.singleton<_i10.NewsDataProvider>(_i10.NewsDataProvider(gh<_i6.Dio>()));
  await gh.singletonAsync<_i11.NewsRepository>(
    () {
      final i = _i12.ProdNewsRepository(
        gh<_i10.NewsDataProvider>(),
        gh<_i9.Mapster>(),
      );
      return i.init().then((_) => i);
    },
    preResolve: true,
  );
  gh.singleton<_i13.NewsService>(_i13.NewsService(gh<_i11.NewsRepository>()));
  gh.singleton<_i14.TopNewsCoordinator>(
      _i15.ProdTopNewsCoordinator(gh<_i7.GlobalKey<_i7.NavigatorState>>()));
  gh.singleton<_i16.AllNewsCoordinator>(
      _i17.ProdAllNewsCoordinator(gh<_i7.GlobalKey<_i7.NavigatorState>>()));
  gh.factory<_i18.ArticleBloc>(() => _i18.ArticleBloc(
        gh<_i13.NewsService>(),
        gh<_i9.Mapster>(),
      ));
  gh.singleton<_i19.CommonMapsterRegistrar>(
      _i19.CommonMapsterRegistrar(gh<_i9.Mapster>())..register());
  gh.factory<_i20.TopNewsBloc>(() => _i20.TopNewsBloc(
        gh<_i21.NewsService>(),
        gh<_i14.TopNewsCoordinator>(),
        gh<_i9.Mapster>(),
      ));
  gh.factory<_i22.AllNewsBloc>(() => _i22.AllNewsBloc(
        gh<_i13.NewsService>(),
        gh<_i16.AllNewsCoordinator>(),
        gh<_i9.Mapster>(),
      ));
  return getIt;
}

class _$RouterModule extends _i23.RouterModule {}

class _$DioModule extends _i24.DioModule {}

class _$MapsterModule extends _i25.MapsterModule {}
