import 'dart:async';
import 'package:count_ui_bloc/BlocProvider.dart';

class IncrementBloc implements BlocBase {
  int _counter;

  //controllerを作成してstreamを使えるようにする
  StreamController<int> _counterController = StreamController<int>();
  //値を通知できるようにしている
  StreamSink<int> get _inAdd => _counterController.sink;
  Stream<int> get outCounter => _counterController.stream;

  StreamController<int> _actionController = StreamController<int>();
  StreamSink<int> get incrementCounter => _actionController.sink;

  IncrementBloc() {
    _counter = 0;
    //_actionController.sink.add(incrementCounter.add)されると関数が通知される(実行される、呼ばれる)
    _actionController.stream.listen(_handleLogic);
  }

  void _handleLogic(data) {
    _counter += 1;
    _inAdd.add(_counter);
  }

  @override
  void dispose() {
    _counterController.close();
    _actionController.close();
  }



}