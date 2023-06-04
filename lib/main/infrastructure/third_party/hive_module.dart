import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

@singleton
class HiveModule {
  @PostConstruct(preResolve: true)
  Future<void> init() {
    return Hive.initFlutter();
  }
}
