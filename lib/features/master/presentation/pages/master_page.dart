import 'package:auto_route/auto_route.dart';
import 'package:edhub_flutter_app/core/constants/constants.dart';
import 'package:edhub_flutter_app/core/router/data/app_router.dart';
import 'package:edhub_flutter_app/core/services/app_services.dart';
import 'package:edhub_flutter_app/core/utils/screen_util/screen_util.dart';
import 'package:flutter/material.dart';

@RoutePage()
class MasterPage extends StatelessWidget {
  const MasterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'MASTER',
          style: AppTextStyles.clashDisplay.s18.w6,
        ),
      ),
      body: Padding(
        padding: AppPaddings.paddingScaffold,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),
            GestureDetector(
              onTap: () {
                AppServices.haptics.hapticLight();
                AppServices.router.push(const GenerateQuizRoute());
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.borderColor,
                  ),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                padding: AppPaddings.symmetric.v32,
                child: Center(
                  child: Text(
                    'Start a new test',
                    style: AppTextStyles.clashDisplay.s20.w4,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
