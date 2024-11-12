import 'dart:io';
import 'package:dio/dio.dart';
import 'package:chat_acad/core/constants/constants.dart';
import 'package:chat_acad/core/resources/data_state.dart';
import 'package:chat_acad/features/daily-news/data/data_source/remote/news_api_service.dart';
import 'package:chat_acad/features/daily-news/data/models/article.dart';
import 'package:chat_acad/features/daily-news/domain/repository/article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository{
  final NewsApiService _newsApiService;
  ArticleRepositoryImpl(this._newsApiService);


  @override
  Future<DataState<List<ArticleModel>>> getNewsArticles() async {
    try {
      final httpResponse = await _newsApiService.getNewsArticles(
        apiKey: newsAPIKey,
        country: countryQuery,
        category: categoryQuery,
      );

      if(httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      }  else {
        return DataFailed(
          DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions
          )
        );
      }
    } on DioException catch(e){
      return DataFailed(e);
    }
  }
  
}