import 'package:flutter/material.dart';
import 'dart:async';
import 'package:count_ui_bloc/Bloc.dart';
import 'package:count_ui_bloc/BlocProvider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child: MaterialApp(
        title: 'Startup Name Generator',
        theme: new ThemeData(primaryColor: Colors.white), //
    // テーマカラ-
        home: Minimum(),
      )
    );
  }
}

class Minimum extends StatefulWidget {
  @override
  _MinimumState createState() => new _MinimumState();
}

class _MinimumState extends State<Minimum> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    final IncrementBloc incrementBloc = BlocProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("最小のBLoC"),
      ),
      body: Center(
        child: StreamBuilder<int>(
            stream: incrementBloc.outCounter,
            initialData: counter,
            builder:  (context, snapshot) {
              return Text("${snapshot.data}");
            }
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            incrementBloc.incrementCounter.add(counter);
          }
      ),
    );
  }
}
