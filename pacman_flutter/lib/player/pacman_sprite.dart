import 'package:bonfire/bonfire.dart';

class PacmanSprite {
  static Future<SpriteAnimation> _sequenceImage(
    String fileName, {
    int amount = 4,
  }) {
    return SpriteAnimation.load(
      'player/$fileName',
      SpriteAnimationData.sequenced(
        amount: amount,
        stepTime: 0.1,
        textureSize: Vector2(19, 13),
        texturePosition: Vector2(0, 0),
      ),
    );
  }

  static Future<SpriteAnimation> get idleLeft =>
      _sequenceImage('pac_left_1.png');
  static Future<SpriteAnimation> get idleRight =>
      _sequenceImage('pac_right_1.png');
  static Future<SpriteAnimation> get runLeft =>
      _sequenceImage('pac_left_1.png');
  static Future<SpriteAnimation> get runRight =>
      _sequenceImage('pac_right_1.png');
  static Future<SpriteAnimation> get up => _sequenceImage('pac_up.png');
  static Future<SpriteAnimation> get down => _sequenceImage('pac_down.png');
  static Future<SpriteAnimation> get dieLeft => SpriteAnimation.load(
        'player/pac_death.png',
        SpriteAnimationData.sequenced(
          amount: 13,
          stepTime: 0.15,
          textureSize: Vector2(19, 13),
          texturePosition: Vector2(0, 0),
        ),
      );
  static Future<SpriteAnimation> get dieRight => SpriteAnimation.load(
        'player/pac_death_right.png',
        SpriteAnimationData.sequenced(
          amount: 13,
          stepTime: 0.15,
          textureSize: Vector2(19, 13),
          texturePosition: Vector2(0, 0),
        ),
      );
}
