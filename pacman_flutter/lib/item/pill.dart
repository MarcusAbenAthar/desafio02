import 'package:bonfire/bonfire.dart';
import 'package:pacman_flutter/item/decoration_sprite_sheet.dart';
import 'package:pacman_flutter/main.dart';
import 'package:pacman_flutter/player/pacman_player.dart';

class Pill extends GameDecoration with ObjectCollision {
  Pill(Vector2 position)
      : super.withSprite(
          sprite: DecorationSpriteSheet.pill,
          position: position,
          size: Vector2(20, 20),
        );
  @override
  void update(double dt) {
    seeComponentType<PacmanPlayer>(
      observed: (player) {
        score += 1;
        removeFromParent();
      },
      radiusVision: 1,
    );
    super.update(dt);
  }
}
