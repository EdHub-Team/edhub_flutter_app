import 'package:auto_route/auto_route.dart';
import 'package:edhub_flutter_app/core/constants/constants.dart';
import 'package:edhub_flutter_app/core/services/app_services.dart';
import 'package:edhub_flutter_app/core/theme/theme.dart';
import 'package:edhub_flutter_app/core/utils/screen_util/screen_util.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CompetePage extends StatelessWidget {
  const CompetePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'COMPETE',
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
                    'Create a new group quiz',
                    style: AppTextStyles.clashDisplay.s20.w4,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                const Expanded(
                  child: Divider(),
                ),
                Text(
                  'OR',
                  style: AppTextStyles.clashDisplay.s20.w4,
                ),
                const Expanded(
                  child: Divider(),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            GestureDetector(
              onTap: () {
                AppServices.haptics.hapticLight();
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(
                        'Enter Quiz Code',
                        style: AppTextStyles.clashDisplay.s16.w4,
                      ),
                      content: TextFormField(
                        controller: TextEditingController(),
                        decoration: InputDecoration(
                          hintText: 'Enter code here',
                          border: AppTheme
                              .darkThemeMode.inputDecorationTheme.border,
                          enabledBorder: AppTheme
                              .darkThemeMode.inputDecorationTheme.enabledBorder,
                          focusedBorder: AppTheme
                              .darkThemeMode.inputDecorationTheme.focusedBorder,
                          contentPadding: AppPaddings.symmetric.h14.v14,
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            // Add your logic here for submitting the quiz code
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Submit',
                            style: AppTextStyles.clashDisplay.s14.w4,
                          ),
                        ),
                      ],
                    );
                  },
                );
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
                    'Join an existing quiz',
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
