import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simon_2/screens/game/game_bloc.dart';
import 'package:simon_2/screens/game/game_event.dart';
import 'package:simon_2/screens/game/game_state.dart';
import 'package:simon_2/util/simon_colors.dart';

class TestScreen extends StatefulWidget {
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  final _gameBloc = CounterBloc();

  AudioCache _player1 = new AudioCache(prefix: 'sounds/');
  AudioCache _player2 = new AudioCache(prefix: 'sounds/');
  AudioCache _player3 = new AudioCache(prefix: 'sounds/');
  AudioCache _player4 = new AudioCache(prefix: 'sounds/');

  @override
  void initState() {
    // Load sounds.
    _player1.load('classic-1.mp3');
    _player2.load('classic-2.mp3');
    _player3.load('classic-3.mp3');
    _player4.load('classic-4.mp3');

    _gameBloc.dispatch(StartGame());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: _gameBloc,
      builder: (context, GameState state) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: AbsorbPointer(
            absorbing: state.locked && !state.over, 
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: FractionallySizedBox(
                    widthFactor: 0.5,
                    heightFactor: 0.5,
                    child: Padding(
                      padding:
                          EdgeInsets.only(left: 8, top: 8, right: 4, bottom: 4),
                      child: RaisedButton(
                        color: !state.locked || state.toggled == 1
                            ? SimonColors.green
                            : SimonColors.greenDisabled,
                        onPressed: () {
                          _gameBloc.dispatch(UserPlay(1));
                        },
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: FractionallySizedBox(
                    widthFactor: 0.5,
                    heightFactor: 0.5,
                    child: Padding(
                      padding:
                          EdgeInsets.only(left: 4, top: 8, right: 8, bottom: 4),
                      child: RaisedButton(
                        color: !state.locked || state.toggled == 2
                            ? SimonColors.red
                            : SimonColors.redDisabled,
                        onPressed: () {
                          _gameBloc.dispatch(UserPlay(2));
                        },
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: FractionallySizedBox(
                    widthFactor: 0.5,
                    heightFactor: 0.5,
                    child: Padding(
                      padding:
                          EdgeInsets.only(left: 8, top: 4, right: 4, bottom: 8),
                      child: RaisedButton(
                        color: !state.locked || state.toggled == 3
                            ? SimonColors.yellow
                            : SimonColors.yellowDisabled,
                        onPressed: () {
                          _gameBloc.dispatch(UserPlay(3));
                        },
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: FractionallySizedBox(
                    widthFactor: 0.5,
                    heightFactor: 0.5,
                    child: Padding(
                      padding:
                          EdgeInsets.only(left: 4, top: 4, right: 8, bottom: 8),
                      child: RaisedButton(
                        color: !state.locked || state.toggled == 4
                            ? SimonColors.blue
                            : SimonColors.blueDisabled,
                        onPressed: () {
                          _gameBloc.dispatch(UserPlay(4));
                        },
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: SimonColors.translucent),
                      child: Padding(
                        padding: EdgeInsets.all(12),
                        child: Text(
                          "${state.score}",
                          style: TextStyle(fontSize: 40, color: Colors.white),
                        ),
                      )),
                ),
                Visibility(
                    visible: state.message == "" ? false : true,
                    child: GestureDetector( 
                      onTapDown: (TapDownDetails details) {
                        if (state.over) {
                          Navigator.pop(context);
                        }
                      },
                      child: Container(
                        color: SimonColors.translucent,
                        child: Stack(
                          children: <Widget>[
                            Center(
                              child: Text(
                                state.message,
                                style: TextStyle(
                                  fontSize: 40,
                                  color: Colors.white,
                                  fontFamily: 'Quantify',
                                ),
                              ),
                            ),
                            Visibility(
                              visible: state.over,
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                  padding: EdgeInsets.only(bottom: 50),
                                  child: Text(
                                    "Tap anywhere to go back",
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.white),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        constraints: BoxConstraints.expand(),
                      ),
                    ))
              ],
            ),
          ),
        );
      },
    );
  }
}
