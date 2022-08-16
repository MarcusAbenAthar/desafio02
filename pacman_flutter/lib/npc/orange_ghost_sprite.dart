import 'package:bonfire/bonfire.dart';

class OrangeGhostSprite {
  static Future<SpriteAnimation> _sequenceImage(
    String fileName, {
    int amount = 1,
  }) {
    return SpriteAnimation.load(
      'npc/$fileName',
      SpriteAnimationData.sequenced(
        amount: amount,
        stepTime: 0.1,
        textureSize: Vector2(32, 32),
        texturePosition: Vector2(0, 0),
      ),
    );
  }

  static Future<SpriteAnimation> get idleLeft =>
      _sequenceImage('orange_ghost_0.png');
  static Future<SpriteAnimation> get idleRight =>
      _sequenceImage('orange_ghost_1.png');
  static Future<SpriteAnimation> get runLeft =>
      _sequenceImage('orange_ghost_0.png');
  static Future<SpriteAnimation> get runRight =>
      _sequenceImage('orange_ghost_1.png');
  static Future<SpriteAnimation> get die => _sequenceImage('spr_afraid_0.png');
}
