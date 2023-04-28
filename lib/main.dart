import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/bloc/product_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  @override
  void initState() {
    BlocProvider.of<ProductBloc>(context)
                  .add(SearchEvent());
    super.initState();
  }


  void _incrementCounter() {
    BlocProvider.of<ProductBloc>(context)
                  .add(SearchEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is CocktailLoading || state is ProductInitial) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is ProductFinishState) {
          return Scaffold(
            appBar: AppBar(),
            body: Text(state.drinks[0].type.toString())
          );
        } else {
          return Container();
        }
      },
    );
  }
}
