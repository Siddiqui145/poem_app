import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:poem_app/src/features/poem/data/repositories/poem_repository_impl.dart';
import 'package:poem_app/src/features/poem/data/sources/sources.dart';
import 'package:poem_app/src/features/poem/domain/usecases/usecases.dart';
import 'package:poem_app/src/features/poem/presentation/bloc/poem_bloc.dart';
import 'package:poem_app/src/features/poem/presentation/pages/poem_screen.dart';

Future<void> main() async {
   final client = http.Client();
  final remoteDataSource = PoemRemoteDataSource(client: client);
  final poemRepository = PoemRepositoryImpl(remoteDataSource: remoteDataSource);
  final getPoemUseCase = GetPoemUseCase(repository: poemRepository);

  runApp(BlocProvider(
    create: (_) => PoemBloc(fetchPoems: getPoemUseCase),
    child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
      ),
      home: PoemScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}