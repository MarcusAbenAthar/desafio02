import 'package:bonfire/bonfire.dart';
import 'package:pacman_flutter/item/decoration_sprite_sheet.dart';
import 'package:pacman_flutter/main.dart';
import 'package:pacman_flutter/player/pacman_player.dart';
import 'dart:async' as async;

class SuperPill extends GameDecoration with ObjectCollision {
  SuperPill(Vector2 position)
      : super.withSprite(
          sprite: DecorationSpriteSheet.superPill,
          position: position,
          size: Vector2(20, 20),
        );
  @override
  void update(double dt) {
    seeComponentType<PacmanPlayer>(
      observed: (player) {
        pacAttack = true;
        pinkGhostAttack = false;
        blueGhostAttack = false;
        redGhostAttack = false;
        orangeGhostAttack = false;
        pinkCanMove = false;
        blueCanMove = false;
        redCanMove = false;
        orangeCanMove = false;
        if (pacAttack) {
          var counter = 10;
          async.Timer.periodic(
            const Duration(seconds: 1),
            (timer) {
              counter--;
              if (counter == 0) {
                pacAttack = false;
                pinkGhostAttack = true;
                blueGhostAttack = true;
                redGhostAttack = true;
                orangeGhostAttack = true;
                pinkCanMove = true;
                blueCanMove = true;
                redCanMove = true;
                orangeCanMove = true;
                timer.cancel();
              }
            },
          );
        }
        removeFromParent();
      },
      radiusVision: 1,
    );
    super.update(dt);
  }
}
