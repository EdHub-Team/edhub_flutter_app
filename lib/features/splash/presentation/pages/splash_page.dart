import 'package:auto_route/auto_route.dart';
import 'package:edhub_flutter_app/core/constants/constants.dart';
import 'package:edhub_flutter_app/core/router/data/router.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SplashPage extends StatelessWidget with AuthGuardMixin {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'SPLASH',
          style: AppTextStyles.clashDisplay.s14,
        ),
      ),
    );
  }
}
