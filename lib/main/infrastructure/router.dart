import 'package:injectable/injectable.dart';

import '../../utils/typedef.dart';

final _rootKey = NavigatorKey();

@module
abstract class RouterModule {
  @singleton
  NavigatorKey get rootKey => _rootKey;
}
