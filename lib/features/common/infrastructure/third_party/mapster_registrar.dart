import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:mapster/mapster.dart';

import '../../application/providers/beautified_date_time_provider.dart';
import '../mappers/mappers.dart';

final _getIt = GetIt.instance;

@singleton
class CommonMapsterRegistrar {
  const CommonMapsterRegistrar(this._mapster);

  final Mapster _mapster;

  @postConstruct
  void register() {
    _mapster
      ..register(
        MapperMeta.two(ArticleResponseToArticleMapper.new),
      )
      ..register(
        MapperMeta.one(
          (input) => ArticleToArticleVMMapper(
            input,
            _getIt.get<BeautifiedDateTimeProvider>(),
          ),
        ),
      )
      ..register(
        MapperMeta.two(
          (input) => NewsResponseToNewsResultMapper(input, _mapster),
        ),
      )
      ..register(MapperMeta.one(ArticleEntityToArticleMapper.new))
      ..register(MapperMeta.one(ArticleToArticleEntityMapper.new));
  }
}
