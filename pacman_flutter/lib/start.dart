import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:pacman_flutter/interface/player_interface.dart';
import 'package:pacman_flutter/item/pill.dart';
import 'package:pacman_flutter/item/super_pill.dart';
import 'package:pacman_flutter/npc/blue_ghost_enemy.dart';
import 'package:pacman_flutter/npc/orange_ghost_enemy.dart';
import 'package:pacman_flutter/npc/pink_ghost_enemy.dart';
import 'package:pacman_flutter/npc/red_ghost_enemy.dart';
import 'package:pacman_flutter/main.dart';
import 'package:pacman_flutter/player/pacman_player.dart';

class Start extends StatefulWidget {
  const Start({Key? key}) : super(key: key);

  @override
  State<Start> createState() => _StartState();
}

class _StartState extends State<Start> {
  @override
  Widget build(BuildContext context) {
    return BonfireTiledWidget(
      map: TiledWorldMap(
        'maps/mapa.json',
        forceTileSize: const Size(
          tileSize,
          tileSize,
        ),
        objectsBuilder: {
          'pink': (properties) => PinkGhostEnemy(properties.position),
          'orange': (properties) => OrangeGhostEnemy(properties.position),
          'red': (properties) => RedGhostEnemy(properties.position),
          'blue': (properties) => BlueGhostEnemy(properties.position),
          'pill': (properties) => Pill(properties.position),
          'superPill': (properties) => SuperPill(properties.position),
        },
      ),
      cameraConfig: CameraConfig(
        moveOnlyMapArea: true,
        smoothCameraEnabled: true,
      ),
      player: PacmanPlayer(
        Vector2(90, 96),
      ),
      overlayBuilderMap: {
        PlayerInterface.overlayKey: ((context, game) =>
            PlayerInterface(game: game))
      },
      initialActiveOverlays: const [PlayerInterface.overlayKey],
      joystick: Joystick(
        keyboardConfig: KeyboardConfig(
          keyboardDirectionalType: KeyboardDirectionalType.wasdAndArrows,
        ),
      ),
    );
  }
}
