import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injector.config.dart';

@InjectableInit(
  preferRelativeImports: true,
  asExtension: false,
)
Future<void> configInjector() async {
  // ignore: await_only_futures
  await init(GetIt.instance);
}
