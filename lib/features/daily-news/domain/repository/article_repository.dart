import 'package:chat_acad/core/resources/data_state.dart';
import 'package:chat_acad/features/daily-news/domain/entities/article.dart';

abstract class ArticleRepository {
  Future<DataState<List<ArticleEntity>>> getNewsArticles();
}