import 'package:flutter/cupertino.dart';
import 'package:count_ui_bloc/Bloc.dart';

//抽象的なクラス
abstract class BlocBase {
  void dispose();
}

class BlocProvider extends InheritedWidget {
  final IncrementBloc incrementBloc;

  BlocProvider({Key key, IncrementBloc incrementBloc, Widget child}) : incrementBloc = incrementBloc ?? IncrementBloc(), super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static IncrementBloc of(BuildContext context) => (context.inheritFromWidgetOfExactType(BlocProvider) as BlocProvider).incrementBloc;
}