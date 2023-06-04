import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';

import '../../application/application.dart';

@Singleton(as: BeautifiedDateTimeProvider)
class ProdBeautifiedDateTimeProvider implements BeautifiedDateTimeProvider {
  @override
  String short(DateTime dt) {
    final now = DateTime.now();

    final diff = now.difference(dt);

    if (diff.inDays >= 30) {
      return DateFormat.yMd().format(dt);
    }

    if (diff.inDays > 1) {
      return DateFormat.Md().format(dt);
    }

    return DateFormat.Hm().format(dt);
  }

  @override
  String full(DateTime dt) {
    return DateFormat.yMMMMd().format(dt);
  }
}
