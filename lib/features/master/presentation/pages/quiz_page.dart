import 'package:auto_route/auto_route.dart';
import 'package:edhub_flutter_app/core/constants/constants.dart';
import 'package:edhub_flutter_app/core/services/app_services.dart';
import 'package:edhub_flutter_app/core/utils/screen_util/screen_util.dart';
import 'package:edhub_flutter_app/features/master/domain/entities/qna.dart';
import 'package:edhub_flutter_app/features/master/presentation/bloc/master_bloc.dart';
import 'package:edhub_flutter_app/shared/presentation/widgets/app_loader.dart';
import 'package:edhub_flutter_app/shared/presentation/widgets/app_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Quiz',
          style: AppTextStyles.clashDisplay.s18.w6,
        ),
      ),
      body: Padding(
        padding: AppPaddings.paddingScaffold,
        child: BlocConsumer<MasterBloc, MasterState>(
          listener: (context, state) {
            if (state is MasterFailure) {
              AppServices.router.maybePop();
              showAppSnackBar(context, state.message);
            }
          },
          builder: (context, state) {
            if (state is MasterLoading) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const AppLoader(),
                  SizedBox(height: 8.h),
                  Text(
                    'Generating Quiz..',
                    style: AppTextStyles.clashDisplay.s16.w4,
                  ),
                ],
              );
            }
            if (state is MasterGenerateQuizSuccess) {
              return Column(
                children: [
                  SizedBox(height: 20.h),
                  Expanded(
                    child: PageView.builder(
                      controller: pageController,
                      scrollDirection: Axis.horizontal,
                      itemCount: state.quiz.qnaList?.length ?? 0,
                      itemBuilder: (context, index) {
                        final QnA? qna = state.quiz.qnaList?[index];
                        return SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Q${index + 1}.  ${qna?.question ?? ''}',
                                style: AppTextStyles.clashDisplay.s18.w6,
                              ),
                              SizedBox(height: 16.h),
                              Text(
                                'A)  ${qna?.options?['a'].toString() ?? ''}',
                                style: AppTextStyles.clashDisplay.s18.w5,
                              ),
                              SizedBox(height: 4.h),
                              Text(
                                'B)  ${qna?.options?['b'].toString() ?? ''}',
                                style: AppTextStyles.clashDisplay.s18.w5,
                              ),
                              SizedBox(height: 4.h),
                              Text(
                                'C)  ${qna?.options?['c'].toString() ?? ''}',
                                style: AppTextStyles.clashDisplay.s18.w5,
                              ),
                              SizedBox(height: 4.h),
                              Text(
                                'D)  ${qna?.options?['d'].toString() ?? ''}',
                                style: AppTextStyles.clashDisplay.s18.w5,
                              ),
                              // SizedBox(height: 24.h),
                              // Text(
                              //   'Explanation: ${qna?.explanation ?? 'NA'}',
                              //   style: AppTextStyles.clashDisplay.s18.w5,
                              // ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          pageController.previousPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.linear,
                          );
                        },
                        child: Text(
                          'Previous',
                          style: AppTextStyles.clashDisplay.s16.w5,
                        ),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () {
                          pageController.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.linear,
                          );
                        },
                        child: Text(
                          'Next',
                          style: AppTextStyles.clashDisplay.s16.w5,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                ],
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
