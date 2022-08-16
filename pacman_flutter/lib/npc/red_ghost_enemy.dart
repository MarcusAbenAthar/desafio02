import 'package:bonfire/bonfire.dart';
import 'package:pacman_flutter/main.dart';
import 'package:pacman_flutter/npc/red_ghost_sprite.dart';

class RedGhostEnemy extends SimpleEnemy
    with ObjectCollision, AutomaticRandomMovement, MoveToPositionAlongThePath {
  bool hit = false;
  RedGhostEnemy(Vector2 position)
      : super(
          position: Vector2(488, 137),
          size: Vector2(16, 16),
          speed: 100,
          animation: SimpleDirectionAnimation(
            idleRight: RedGhostSprite.idleRight,
            runRight: RedGhostSprite.runRight,
            idleLeft: RedGhostSprite.idleLeft,
            runLeft: RedGhostSprite.runLeft,
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
    // print(position);
    if (redCanMove && redGhostAttack) {
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
    if ((Vector2(488, 135)) == position && hit == true) {
      redCanMove = true;
      hit = false;
      redGhostAttack = true;
    }
    super.update(dt);
  }

  @override
  void receiveDamage(AttackFromEnum attacker, double damage, identify) {
    moveToPositionAlongThePath(Vector2(488, 135));
    hit = true;
    die();
    super.receiveDamage(attacker, damage, identify);
  }

  @override
  void die() {
    animation?.playOnce(
      RedGhostSprite.die,
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
