// import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:vector_math/vector_math_64.dart' as vector;

// class HelloWorld extends StatefulWidget {
//   const HelloWorld({super.key});

//   @override
//   _HelloWorldState createState() => _HelloWorldState();
// }

// class _HelloWorldState extends State<HelloWorld> {
//   late ArCoreController arCoreController;
//   bool isCameraPermissionGranted = false;

//   @override
//   void initState() {
//     _requestPermission();
//     super.initState();
//   }

//   void _requestPermission() async {
//     isCameraPermissionGranted = (await Permission.camera.isGranted);
//     if (!isCameraPermissionGranted) {
//       final status = await Permission.camera.request();
//       if (status == PermissionStatus.granted) {
//         setState(() {
//           isCameraPermissionGranted = true;
//         });
//       }
//     } else {
//       setState(() {
//         isCameraPermissionGranted = true;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Hello World'),
//         ),
//         body: isCameraPermissionGranted
//             ? ArCoreView(
//                 onArCoreViewCreated: _onArCoreViewCreated,
//                 debug: true,
//               )
//             : const CircularProgressIndicator(),
//       ),
//     );
//   }

//   void _onArCoreViewCreated(ArCoreController controller) {
//     arCoreController = controller;
//     arCoreController.init();

//     _addSphere(arCoreController);
//     _addCylindre(arCoreController);
//     _addCube(arCoreController);
//   }

//   void _addSphere(ArCoreController controller) {
//     final material =
//         ArCoreMaterial(color: const Color.fromARGB(120, 66, 134, 244));
//     final sphere = ArCoreSphere(
//       materials: [material],
//       radius: 0.1,
//     );
//     final node = ArCoreNode(
//       shape: sphere,
//       position: vector.Vector3(0, 0, -1.5),
//     );
//     controller.addArCoreNode(node);
//   }

//   void _addCylindre(ArCoreController controller) {
//     final material = ArCoreMaterial(
//       color: Colors.red,
//       reflectance: 1.0,
//     );
//     final cylindre = ArCoreCylinder(
//       materials: [material],
//       radius: 0.5,
//       height: 0.3,
//     );
//     final node = ArCoreNode(
//       shape: cylindre,
//       position: vector.Vector3(0.0, -0.5, -2.0),
//     );
//     controller.addArCoreNode(node);
//   }

//   Future<Uint8List> getImageBytes(String imageName) async {
//     final ByteData data = await rootBundle.load('assets/$imageName');
//     return data.buffer.asUint8List();
//   }

//   void _addCube(ArCoreController controller) async {
//     final image = await getImageBytes('test-ar.png');
//     final material = ArCoreMaterial(
//       color: Colors.amber, //const Color.fromARGB(120, 66, 134, 244),
//       textureBytes: image,
//     );
//     final cube = ArCoreCube(
//       materials: [material],
//       size: vector.Vector3(0, 0, -1.5),
//     );

//     final node = ArCoreNode(
//       shape: cube,
//       position: vector.Vector3(-0.5, 0.5, -3.5),
//     );
//     controller.addArCoreNode(node);
//   }

import 'package:flutter/material.dart';
import 'package:flutter_unity_widget/flutter_unity_widget.dart';
import 'package:permission_handler/permission_handler.dart';

class HelloWorld extends StatefulWidget {
  const HelloWorld({super.key});

  @override
  State<HelloWorld> createState() => _HelloWorldState();
}

class _HelloWorldState extends State<HelloWorld> {
  late UnityWidgetController controller;

  @override
  void dispose() {
    controller.quit();
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hello World'),
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
  }

  void onUnityMessage(handler) {}

  void onUnitySceneLoaded(SceneLoaded? message) {}
}
