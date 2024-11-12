import 'package:chat_acad/config/theme/app_themes.dart';
import 'package:chat_acad/features/daily-news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:chat_acad/features/daily-news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:chat_acad/features/daily-news/presentation/pages/home/daily_news.dart';
import 'package:flutter/material.dart';
import 'package:chat_acad/injection_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteArticleBloc>(
      create: (context) => sl()..add(const GetArticles()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme(),
        home: const DailyNews(),
      ),
    );
  }
}
