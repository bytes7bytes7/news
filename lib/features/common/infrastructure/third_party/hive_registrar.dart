import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

import '../db_entities/article_entity/article_entity.dart';

@singleton
class CommonHiveRegistrar {
  @postConstruct
  void register() {
    Hive.registerAdapter(ArticleEntityAdapter());
  }
}
