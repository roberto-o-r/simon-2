import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simon_2/screens/game/game_bloc.dart';
import 'package:simon_2/screens/game/game_event.dart';
import 'package:simon_2/screens/game/game_state.dart';

class TestScreen extends StatefulWidget {
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  final _gameBloc = CounterBloc();

  @override
  void initState() {
    super.initState();

    _gameBloc.dispatch(IncrementEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: _gameBloc,
      builder: (context, CounterState state) {
        return Scaffold(
            backgroundColor: Colors.red,
            body: Center(
              child: Text("Length: ${state.counter}"),
            ));
      },
    );
  }
}
