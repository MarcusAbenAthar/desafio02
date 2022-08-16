import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:pacman_flutter/main.dart';
import 'dart:async' as async;

class PlayerInterface extends StatefulWidget {
  static const overlayKey = 'playerInterface';
  final BonfireGame game;
  const PlayerInterface({Key? key, required this.game}) : super(key: key);

  @override
  State<PlayerInterface> createState() => _PlayerInterfaceState();
}

class _PlayerInterfaceState extends State<PlayerInterface> {
  late async.Timer _timer;
  final int _score = 0;

  void _verifyScore(async.Timer timer) {
    if (score != _score) {
      setState(() {
        score;
      });
    }
  }

  @override
  void initState() {
    _timer = async.Timer.periodic(
      const Duration(milliseconds: 100),
      _verifyScore,
    );
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Score: ${score.toString()}',
              style: const TextStyle(
                decoration: TextDecoration.none,
                color: Colors.white,
                fontWeight: FontWeight.normal,
                fontSize: 19,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
