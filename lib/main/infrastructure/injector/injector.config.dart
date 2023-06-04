// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:mapster/mapster.dart' as _i6;

import '../../../features/common/application/application.dart' as _i3;
import '../../../features/common/domain/repositories/news_repository.dart'
    as _i8;
import '../../../features/common/domain/services/news_service.dart' as _i10;
import '../../../features/common/domain/services/services.dart' as _i12;
import '../../../features/common/infrastructure/data_providers/news_data_provider.dart'
    as _i7;
import '../../../features/common/infrastructure/providers/beautified_date_time_provider.dart'
    as _i4;
import '../../../features/common/infrastructure/repositories/news_repository.dart'
    as _i9;
import '../../../features/common/infrastructure/third_party/mapster_registrar.dart'
    as _i14;
import '../../../features/news/application/blocs/all_news/all_news_bloc.dart'
    as _i13;
import '../../../features/news/application/blocs/top_news/top_news_bloc.dart'
    as _i11;
import '../third_party/dio_module.dart' as _i15;
import '../third_party/mapster_module.dart' as _i16;

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt init(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final dioModule = _$DioModule();
  final mapsterModule = _$MapsterModule();
  gh.singleton<_i3.BeautifiedDateTimeProvider>(
      _i4.ProdBeautifiedDateTimeProvider());
  gh.singleton<_i5.Dio>(dioModule.dio);
  gh.singleton<_i6.Mapster>(mapsterModule.mapster);
  gh.singleton<_i7.NewsDataProvider>(_i7.NewsDataProvider(gh<_i5.Dio>()));
  gh.singleton<_i8.NewsRepository>(_i9.ProdNewsRepository(
    gh<_i7.NewsDataProvider>(),
    gh<_i6.Mapster>(),
  ));
  gh.singleton<_i10.NewsService>(_i10.NewsService(gh<_i8.NewsRepository>()));
  gh.factory<_i11.TopNewsBloc>(() => _i11.TopNewsBloc(
        gh<_i12.NewsService>(),
        gh<_i6.Mapster>(),
      ));
  gh.factory<_i13.AllNewsBloc>(() => _i13.AllNewsBloc(
        gh<_i10.NewsService>(),
        gh<_i6.Mapster>(),
      ));
  gh.singleton<_i14.CommonMapsterRegistrar>(
      _i14.CommonMapsterRegistrar(gh<_i6.Mapster>())..register());
  return getIt;
}

class _$DioModule extends _i15.DioModule {}

class _$MapsterModule extends _i16.MapsterModule {}
