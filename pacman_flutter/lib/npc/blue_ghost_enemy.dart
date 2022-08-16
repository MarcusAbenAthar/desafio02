import 'package:bonfire/bonfire.dart';
import 'package:pacman_flutter/main.dart';
import 'package:pacman_flutter/npc/blue_ghost_sprite.dart';

class BlueGhostEnemy extends SimpleEnemy
    with ObjectCollision, AutomaticRandomMovement, MoveToPositionAlongThePath {
  bool hit = false;

  @override
  BlueGhostEnemy(Vector2 position)
      : super(
          life: 1,
          position: position,
          size: Vector2(16, 16),
          speed: 100,
          animation: SimpleDirectionAnimation(
            idleRight: BlueGhostSprite.idleRight,
            runRight: BlueGhostSprite.runRight,
            idleLeft: BlueGhostSprite.idleLeft,
            runLeft: BlueGhostSprite.runLeft,
          ),
        ) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.circle(
            radius: 11,
            align: Vector2(-3, -4),
          ),
        ],
      ),
    );
  }
  @override
  void update(double dt) {
    if (blueCanMove && blueGhostAttack) {
      seeAndMoveToPlayer(
        notObserved: () {
          runRandomMovement(
            dt,
            timeKeepStopped: 0,
            speed: 100,
            maxDistance: 1000,
          );
        },
        closePlayer: (player) {
          _executeAttack();
        },
        radiusVision: 200,
      );
    }

    super.update(dt);
  }

  @override
  void receiveDamage(AttackFromEnum attacker, double damage, identify) {
    moveToPositionAlongThePath(Vector2(552, 136));
    hit = true;
    die();
    super.receiveDamage(attacker, damage, identify);
  }

  @override
  void die() {
    animation?.playOnce(
      BlueGhostSprite.die,
      runToTheEnd: true,
    );
    super.die();
  }

  void _executeAttack() {
    simpleAttackMelee(
      damage: 2,
      interval: 0,
      size: Vector2(25, 25),
    );
  }
}
