import 'package:edhub_flutter_app/core/router/data/router.dart';
import 'package:flutter/material.dart';

part 'utils/observer.dart';
part 'utils/guard.dart';

abstract class AppRouter<I> {
  // static final AppRouterImpl instance = AppRouterImpl();

  //TODO: handle deeplink and push notification nav
  // void onDeepLink(DeepLink deepLink);
  //
  // void onPushNotification(AppPushNotification pushNotification);
}
