import 'dart:convert';

import 'package:edhub_flutter_app/core/secrets/app_secrets.dart';
import 'package:edhub_flutter_app/features/master/data/models/quiz_model.dart';
import 'package:edhub_flutter_app/features/master/domain/entities/quiz.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

abstract interface class MasterRemoteDataSource {
  Future<Quiz> generateTest({
    required String topic,
    required int difficultyLevel,
  });
}

class MasterRemoteDataSourceImpl implements MasterRemoteDataSource {
  @override
  Future<Quiz> generateTest({
    required String topic,
    required int difficultyLevel,
  }) async {
    try {
      final model = GenerativeModel(
        model: 'gemini-pro',
        apiKey: AppSecrets.geminiAPI,
      );
      final prompt =
          'You are a test/quiz generator for college and school students. '
          'Follow these instructions: '
          '1. You will get a topic in the prompt. '
          '2. Generate a quiz with 3 questions on that topic. '
          '3. Each question should have 4 options. '
          '4. Include the correct answer for each question. '
          '5. Provide a description or explanation for each correct answer. DO NOT give a wrong explanation. '
          '6. Difficulty Level: $difficultyLevel/10. '
          '7. Only put questions to which you know the correct answer for sure. '
          '8. Return response in the following json format only: '
          '{'
          '"title": "give a two-word title to the quiz here",'
          '"qnaList": ['
          '{'
          '"question": "question will come here",'
          '"options":{'
          '"a": "option 1",'
          '"b": "option 2",'
          '"c":"option 3",'
          '"d":"option 4"'
          '},'
          '"answer": "a",'
          '"explanation": "give a detailed explanation here"'
          '},'
          ']'
          '}'
          ''
          ''
          '----------------------'
          'TOPIC: $topic';

      final List<Content> content = [Content.text(prompt)];
      final GenerateContentResponse response =
          await model.generateContent(content);
      if (response.text?.isEmpty ?? true) {
        throw ServerException('Response is null');
      }

      print(response.text);
      final jsonResponse =
          jsonDecode(response.text ?? '') as Map<String, dynamic>;
      final quiz = QuizModel.fromJson(jsonResponse);
      return quiz;
    } on ServerException catch (error) {
      throw ServerException(error.toString());
    } catch (error) {
      throw Exception(error.toString());
    }
  }
}


//PROMPT

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
// "question": "question will come here",
// "options":{
// "a": "option 1",
// "b": "option 2",
// "c":"option 3",
// "d":"option 4"
// },
// "answer": "a",
// "explanation": "give a detailed explanation here"
// },
// ]
// }


// ----------------------
// TOPIC: FORCE IN PHYSICS
