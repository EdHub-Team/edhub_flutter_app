import 'package:edhub_flutter_app/core/router/data/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
part 'haptics/haptics.dart';

class AppServices {
  AppServices._();
  static final BuildContext currentContext =
      router.navigatorKey.currentContext!;
  static final AppRouterImpl router = AppRouterImpl();
  static final AppHaptic haptics = AppHaptic._();
}
