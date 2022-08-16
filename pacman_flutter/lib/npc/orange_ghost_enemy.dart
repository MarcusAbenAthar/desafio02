import 'package:bonfire/bonfire.dart';
import 'package:pacman_flutter/main.dart';
import 'package:pacman_flutter/npc/orange_ghost_sprite.dart';

class OrangeGhostEnemy extends SimpleEnemy
    with ObjectCollision, AutomaticRandomMovement, MoveToPositionAlongThePath {
  bool hit = false;
  OrangeGhostEnemy(Vector2 position)
      : super(
          position: position,
          size: Vector2(16, 16),
          speed: 100,
          animation: SimpleDirectionAnimation(
            idleRight: OrangeGhostSprite.idleRight,
            runRight: OrangeGhostSprite.runRight,
            idleLeft: OrangeGhostSprite.idleLeft,
            runLeft: OrangeGhostSprite.runLeft,
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
    if (orangeCanMove && orangeGhostAttack) {
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
    if ((Vector2(616, 137)) == position && hit == true) {
      orangeCanMove = true;
      hit = false;
      orangeGhostAttack = true;
    }
    super.update(dt);
  }

  @override
  void receiveDamage(AttackFromEnum attacker, double damage, identify) {
    moveToPositionAlongThePath(Vector2(616, 136));
    hit = true;
    die();
    super.receiveDamage(attacker, damage, identify);
  }

  @override
  void die() {
    animation?.playOnce(
      OrangeGhostSprite.die,
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
