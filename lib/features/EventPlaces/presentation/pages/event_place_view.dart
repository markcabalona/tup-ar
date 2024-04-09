import 'package:flutter/material.dart';
import 'package:flutter_unity_widget/flutter_unity_widget.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tup_ar/features/EventPlaces/domain/entities/event_place.dart';

class EventPlaceView extends StatefulWidget {
  final EventPlace eventPlace;

  const EventPlaceView({
    Key? key,
    required this.eventPlace,
  }) : super(key: key);

  @override
  State<EventPlaceView> createState() => _EventPlaceViewState();
}

class _EventPlaceViewState extends State<EventPlaceView> {
  late UnityWidgetController controller;

  @override
  void dispose() {
    // controller.unload();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.eventPlace.name),
      ),
      body: UnityWidget(
        onUnityCreated: onUnityCreated,
        onUnityMessage: onUnityMessage,
        onUnitySceneLoaded: onUnitySceneLoaded,
        fullscreen: false,
        unloadOnDispose: true,
        useAndroidViewSurface: true,
      ),
    );
  }

  void onUnityCreated(UnityWidgetController ctrl) async {
    controller = ctrl;
    const cameraPermission = Permission.camera;
    if ((await cameraPermission.status) != PermissionStatus.granted) {
      await cameraPermission.request();
    }
    final isPaused = await controller.isPaused() ?? false;
    final isReady = await controller.isReady() ?? false;

    if (isPaused && isReady) {
      controller.resume();
    }

    await controller.postMessage(
      'ContentParent',
      'LoadContent',
      widget.eventPlace.modelUrl,
    );
  }

  void onUnityMessage(handler) {}

  void onUnitySceneLoaded(SceneLoaded? message) {}
}
