import 'package:flutter/material.dart';
import 'package:image_search/data/data_source/pixabay_api.dart';

import 'package:image_search/data/photo_provider.dart';
import 'package:image_search/data/repository/photo_api_repository_impl.dart';
import 'package:image_search/presentation/home/HomeScreen.dart';
import 'package:image_search/presentation/home/home_view_model.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
        create: (_) => HomeViewModel(PhotoApiRepositoryImpl(PixabayApi(http.Client()))),
        child: const HomeScreen(),
      ),
    );
  }
}
