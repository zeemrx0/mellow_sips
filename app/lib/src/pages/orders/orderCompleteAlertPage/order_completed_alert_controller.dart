import 'package:app/src/components/features/appBar/app_bar_basic_widget.dart';
import 'package:app/src/components/main/button/app_button_base_builder.dart';
import 'package:app/src/components/main/text/app_text_base_builder.dart';
import 'package:app/src/components/page/app_main_page_base_builder.dart';
import 'package:app/src/config/app_theme.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resources/resources.dart';
import 'package:vibration/vibration.dart';

part './order_completed_alert_page.dart';
part './order_completed_alert_binding.dart';

class OrderCompletedAlertController extends GetxController {
  final player = AudioPlayer();

  @override
  dispose() async {
    await stopAlert();
    super.dispose();
  }

  Future<void> alert() async {
    bool hasVibrator = await Vibration.hasVibrator() ?? false;

    if (hasVibrator) {
      Vibration.vibrate(pattern: [100, 200, 400], amplitude: 255, repeat: 1);

      player.setReleaseMode(ReleaseMode.loop);
      player.play(AssetSource('audio/bf_fnf_beep.mp3'));
    }

    Future.delayed(const Duration(seconds: 20), () async {
      stopAlert();
    });
  }

  Future<void> stopAlert() async {
    bool hasVibrator = await Vibration.hasVibrator() ?? false;

    if (hasVibrator) {
      Vibration.cancel();

      player.stop();
    }
  }
}
