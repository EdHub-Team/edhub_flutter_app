import 'package:auto_route/auto_route.dart';
import 'package:edhub_flutter_app/core/constants/constants.dart';
import 'package:flutter/material.dart';

@RoutePage()
class LearnPage extends StatelessWidget {
  const LearnPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(
            'Start a new topic',
            style: AppTextStyles.clashDisplay.s16.w6,
          ),
        ],
      ),
    );
  }
}
