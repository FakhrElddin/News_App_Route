import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:news_app/bloc_observer.dart';
import 'package:news_app/models/news_response_model.dart';
import 'package:news_app/models/sources_response_model.dart';
import 'package:news_app/screens/home_screen.dart';
import 'package:path_provider/path_provider.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  final directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.initFlutter();
  Hive.registerAdapter(SourcesResponseModelAdapter());
  Hive.registerAdapter(SourcesAdapter());
  Hive.registerAdapter(NewsResponseModelAdapter());
  Hive.registerAdapter(ArticlesAdapter());
  Hive.registerAdapter(SourceAdapter());
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName : (context) => HomeScreen(),
      },
    );
  }
}
