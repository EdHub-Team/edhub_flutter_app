import 'dart:convert';
import 'dart:io';

import 'package:edhub_flutter_app/core/secrets/app_secrets.dart';
import 'package:edhub_flutter_app/features/learn/data/models/summary_model.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:mime/mime.dart';

abstract interface class LearnRemoteDataSource {
  Future<SummaryModel> summarizeFromImage({
    required File image,
  });
}

class LearnRemoteDataSourceImpl implements LearnRemoteDataSource {
  @override
  Future<SummaryModel> summarizeFromImage({
    required File image,
  }) async {
    try {
      final model = GenerativeModel(
        model: 'gemini-1.5-flash',
        apiKey: AppSecrets.geminiAPI,
      );
      const prompt =
          'You are a tutor for college and school students of India.\n'
          'Follow these instructions:\n'
          'Summarize the topic(s) or content in the given image.'
          'Return a direct json response in the below format (Do not write any additional text. Give ONLY json) :\n'
          '{'
          '"title": "give a two-word title to the topic here",'
          '"summary": "give your short summary here",'
          '"detailedExplanation": "give your detailed explanation here"'
          '}';

      final bytes = await image.readAsBytes();
      final mimeType = lookupMimeType(image.path);
      final content = Content.multi([
        TextPart(prompt),
        DataPart(mimeType ?? 'image/', bytes),
      ]);

      final GenerateContentResponse response =
          await model.generateContent([content]);
      if (response.text?.isEmpty ?? true) {
        throw ServerException('Response is null');
      }

      print(response.text);
      final jsonResponse =
          jsonDecode(response.text ?? '') as Map<String, dynamic>;
      final summary = SummaryModel.fromJson(jsonResponse);
      return summary;
    } on ServerException catch (error) {
      throw ServerException(error.toString());
    } catch (error) {
      throw Exception(error.toString());
    }
  }
}
