import 'package:bonfire/bonfire.dart';
import 'package:pacman_flutter/player/pacman_sprite.dart';
import '../main.dart';

class PacmanPlayer extends SimplePlayer with ObjectCollision {
  PacmanPlayer(Vector2 position)
      : super(
          life: 1,
          position: position,
          size: Vector2(
            tileSize + 1,
            tileSize + 1,
          ),
          animation: SimpleDirectionAnimation(
            idleRight: PacmanSprite.idleRight,
            runRight: PacmanSprite.runRight,
            idleLeft: PacmanSprite.idleLeft,
            runLeft: PacmanSprite.runLeft,
            runUp: PacmanSprite.up,
            idleUp: PacmanSprite.up,
            runDown: PacmanSprite.down,
            idleDown: PacmanSprite.down,
          ),
        ) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: Vector2(tileSize - 5, tileSize - 5),
          )
        ],
      ),
    );
  }
  @override
  void die() {
    if (lastDirectionHorizontal == Direction.left) {
      animation?.playOnce(
        PacmanSprite.dieLeft,
        runToTheEnd: true,
        onFinish: () {
          removeFromParent();
        },
      );
      super.die();
    } else {
      animation?.playOnce(
        PacmanSprite.dieRight,
        runToTheEnd: true,
        onFinish: () {
          removeFromParent();
        },
      );
      super.die();
    }
  }

  @override
  void update(double dt) {
    if (pacAttack) {
      seeEnemy(observed: (enemy) {
        _attack();
      });
    }
    super.update(dt);
  }

  @override
  void receiveDamage(AttackFromEnum attacker, double damage, identify) {
    life -= damage;
    super.receiveDamage(attacker, damage, identify);
  }

  void _attack() {
    simpleAttackMelee(
      damage: 2,
      withPush: false,
      size: Vector2(tileSize, tileSize),
    );
  }
}
