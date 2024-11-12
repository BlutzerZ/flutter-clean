import 'package:chat_acad/core/resources/data_state.dart';
import 'package:chat_acad/features/daily-news/domain/usecases/get_article.dart';
import 'package:chat_acad/features/daily-news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:chat_acad/features/daily-news/presentation/bloc/article/remote/remote_article_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RemoteArticleBloc extends Bloc<RemoteArticleEvent, RemoteArticleState> {
  final GetArticleUseCase _getArticleUseCase;
  RemoteArticleBloc(this._getArticleUseCase)
      : super(const RemoteArticleLoading()) {
    on<GetArticles>(onGetArticles);
  }

  void onGetArticles(
      GetArticles event, Emitter<RemoteArticleState> emit) async {
    final dataState = await _getArticleUseCase();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(RemoteArticleDone(dataState.data!));
    }

    if (dataState is DataFailed) {
      print(dataState.error!.message);
      emit(RemoteArticleError(dataState.error!));
    }
  }
}
