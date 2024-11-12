import 'package:chat_acad/features/daily-news/domain/entities/article.dart';
import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';

abstract class RemoteArticleState extends Equatable {
  final List<ArticleEntity> ? articles;
  final DioException ? error;

  const RemoteArticleState({this.articles, this.error});

  @override
  List<Object> get props => [articles!, error!];
}

class RemoteArticleLoading extends RemoteArticleState {
  const RemoteArticleLoading();
}

class RemoteArticleDone extends RemoteArticleState {
  const RemoteArticleDone(List<ArticleEntity> article) : super(articles: article);
}

class RemoteArticleError extends RemoteArticleState {
  const RemoteArticleError(DioException error) : super(error: error);
}