import 'package:bonfire/bonfire.dart';

class DecorationSpriteSheet {
  static Future<Sprite> get pill => Sprite.load(
        'item/pill_2.png',
        srcSize: Vector2(16, 16),
      );
  static Future<Sprite> get openPill => Sprite.load(
        'item/pill_2.png',
        srcSize: Vector2(16, 16),
      );
  static Future<Sprite> get superPill => Sprite.load(
        'item/super_pill_1.png',
        srcSize: Vector2(16, 16),
      );
}
