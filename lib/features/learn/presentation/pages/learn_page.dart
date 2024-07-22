import 'package:auto_route/auto_route.dart';
import 'package:edhub_flutter_app/core/constants/constants.dart';
import 'package:edhub_flutter_app/core/router/data/app_router.dart';
import 'package:edhub_flutter_app/core/services/app_services.dart';
import 'package:edhub_flutter_app/core/utils/pick_image.dart';
import 'package:edhub_flutter_app/core/utils/screen_util/screen_util.dart';
import 'package:edhub_flutter_app/features/learn/presentation/bloc/learn_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class LearnPage extends StatelessWidget {
  const LearnPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'LEARN',
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
              onTap: () async {
                AppServices.haptics.hapticLight();
                final image = await pickImage();
                if (image != null) {
                  context.read<LearnBloc>().add(
                        LearnSummarizeFromImage(
                          image: image,
                        ),
                      );
                  AppServices.router.push(const SummaryRoute());
                }
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
                    'Summarize from image',
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
