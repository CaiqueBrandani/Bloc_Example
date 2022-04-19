import 'pages/bloc/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aplicativo_bloc/home_page.dart';
import 'package:aplicativo_bloc/pages/bloc/home_bloc.dart';
import 'package:aplicativo_bloc/pages/bloc/home_event.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: BlocProvider<HomeBloc>(
        create: (BuildContext context) => 
          HomeBloc(HomeErrorState(message: 'Erro ao carregar os dados!'))..add(HomeFetchListWithError()),
        child: const HomePage(),
      ),
    );
  }
}
