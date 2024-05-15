import 'package:auto_route/auto_route.dart';
import 'package:edhub_flutter_app/core/constants/constants.dart';
import 'package:edhub_flutter_app/core/router/data/app_router.dart';
import 'package:edhub_flutter_app/core/services/app_services.dart';
import 'package:edhub_flutter_app/core/theme/theme.dart';
import 'package:edhub_flutter_app/core/utils/screen_util/screen_util.dart';
import 'package:edhub_flutter_app/features/master/presentation/bloc/master_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class GenerateQuizPage extends StatefulWidget {
  const GenerateQuizPage({super.key});

  @override
  State<GenerateQuizPage> createState() => _GenerateQuizPageState();
}

class _GenerateQuizPageState extends State<GenerateQuizPage> {
  double difficultyLevel = 5;
  final topicController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    topicController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: Text(
          //   'MASTER',
          //   style: AppTextStyles.clashDisplay.s18.w6,
          // ),
          ),
      body: Padding(
        padding: AppPaddings.paddingScaffold,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Topic',
              style: AppTextStyles.clashDisplay.s16.w6,
            ),
            SizedBox(height: 8.h),
            TextFormField(
              controller: topicController,
              decoration: InputDecoration(
                hintText: 'Topic',
                border: AppTheme.darkThemeMode.inputDecorationTheme.border,
                enabledBorder:
                    AppTheme.darkThemeMode.inputDecorationTheme.enabledBorder,
                focusedBorder:
                    AppTheme.darkThemeMode.inputDecorationTheme.focusedBorder,
                contentPadding: AppPaddings.symmetric.h14.v14,
              ),
            ),
            SizedBox(height: 24.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Difficulty Level',
                  style: AppTextStyles.clashDisplay.s16.w6,
                ),
                Text(
                  '${difficultyLevel.toInt()}/10',
                  style: AppTextStyles.clashDisplay.s16.w4,
                ),
              ],
            ),
            SizedBox(height: 8.h),
            Slider(
              value: difficultyLevel,
              max: 10,
              divisions: 10,
              onChanged: (value) {
                setState(() {
                  difficultyLevel = value;
                });
              },
            ),
            SizedBox(height: 24.h),
            Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    AppColors.gradient2,
                    AppColors.gradient3,
                  ],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                ),
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: ElevatedButton(
                onPressed: () {
                  context.read<MasterBloc>().add(
                        MasterGenerateQuiz(
                          difficultyLevel: difficultyLevel.toInt(),
                          topic: topicController.text,
                        ),
                      );
                  AppServices.router.push(const QuizRoute());
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(1.sw, 40.h),
                  backgroundColor: AppColors.transparentColor,
                  shadowColor: AppColors.transparentColor,
                ),
                child: Text(
                  'Generate Quiz',
                  style: AppTextStyles.clashDisplay.s16.w6,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



// PROMPT
 
// You are a test/quiz generator for college and school students. 

// Follow these instructions:
// You will get a topic in the prompt.
// Generate a quiz with 10 questions on that topic.
// Each question should have 4 options.
// Include the correct answer for each question.
// Provide a description or explanation for each correct answer

// Return your response in the following format: 
// {
// "data": [
// {
// "question": "Who is largest animal?",
// "options":{
// "a": "cat",
// "b": "dog",
// "c":"lion",
// "d":"bear"
// },
// "answer": "a",
// "explanation": "give a detailed explanation here"
// },
// ]
// }


// ----------------------
// TOPIC: FORCE IN PHYSICS