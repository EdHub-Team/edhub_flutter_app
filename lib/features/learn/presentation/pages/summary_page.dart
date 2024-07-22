import 'package:auto_route/auto_route.dart';
import 'package:edhub_flutter_app/core/constants/constants.dart';
import 'package:edhub_flutter_app/core/services/app_services.dart';
import 'package:edhub_flutter_app/core/utils/screen_util/screen_util.dart';
import 'package:edhub_flutter_app/features/learn/presentation/bloc/learn_bloc.dart';
import 'package:edhub_flutter_app/shared/presentation/widgets/app_loader.dart';
import 'package:edhub_flutter_app/shared/presentation/widgets/app_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class SummaryPage extends StatelessWidget {
  const SummaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Summary',
          style: AppTextStyles.clashDisplay.s18.w6,
        ),
      ),
      body: Padding(
        padding: AppPaddings.paddingScaffold,
        child: BlocConsumer<LearnBloc, LearnState>(
          listener: (context, state) {
            if (state is LearnFailure) {
              AppServices.router.maybePop();
              showAppSnackBar(context, state.message);
            }
          },
          builder: (context, state) {
            if (state is LearnLoading) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const AppLoader(),
                  SizedBox(height: 8.h),
                  Text(
                    'Summarising..',
                    style: AppTextStyles.clashDisplay.s16.w4,
                  ),
                ],
              );
            }
            if (state is LearnSummarizeFromImageSuccess) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.h),
                    Text(
                      'Topic:  ${state.summary.title ?? 'NA'}',
                      style: AppTextStyles.clashDisplay.s18.w6,
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      'Summary',
                      style: AppTextStyles.clashDisplay.s16.w6,
                    ),
                    Text(
                      state.summary.summary ?? '',
                      style: AppTextStyles.clashDisplay.s16,
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      'Detailed Explanation',
                      style: AppTextStyles.clashDisplay.s16.w6,
                    ),
                    Text(
                      state.summary.detailedExplanation ?? '',
                      style: AppTextStyles.clashDisplay.s16,
                    ),
                    SizedBox(height: 20.h),
                  ],
                ),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
