import 'package:chat_acad/features/daily-news/data/data_source/remote/news_api_service.dart';
import 'package:chat_acad/features/daily-news/data/repository/article_repository_impl.dart';
import 'package:chat_acad/features/daily-news/domain/repository/article_repository.dart';
import 'package:chat_acad/features/daily-news/domain/usecases/get_article.dart';
import 'package:chat_acad/features/daily-news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<Dio>(Dio());

  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));

  sl.registerSingleton<ArticleRepository>(
    ArticleRepositoryImpl(sl())
  );

  sl.registerSingleton<GetArticleUseCase>(
    GetArticleUseCase(sl())
  );

  sl.registerFactory<RemoteArticleBloc>(
    () => RemoteArticleBloc(sl())
  );
}