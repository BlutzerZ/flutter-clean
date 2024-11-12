import 'package:chat_acad/core/resources/data_state.dart';
import 'package:chat_acad/core/usecase/usecase.dart';
import 'package:chat_acad/features/daily-news/domain/entities/article.dart';
import 'package:chat_acad/features/daily-news/domain/repository/article_repository.dart';

class GetArticleUseCase implements Usecase<DataState<List<ArticleEntity>>, void> {
  final ArticleRepository _articleRepository;
  GetArticleUseCase(this._articleRepository);
  
  @override
  Future<DataState<List<ArticleEntity>>> call({void params}) {
    return _articleRepository.getNewsArticles();
  }
  
}