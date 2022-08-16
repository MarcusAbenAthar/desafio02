import 'package:flutter/material.dart';
import 'start.dart';

const double tileSize = 32;
int score = 0;
bool pacAttack = false;
bool pinkGhostAttack = true;
bool blueGhostAttack = true;
bool redGhostAttack = true;
bool orangeGhostAttack = true;
bool pinkCanMove = true;
bool blueCanMove = true;
bool redCanMove = true;
bool orangeCanMove = true;

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Start(),
    ),
  );
}
