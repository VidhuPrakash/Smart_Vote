import 'dart:io';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_mlkit_commons/google_mlkit_commons.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smart_vote_/reg_ui/face/face_success.dart';
import 'package:smart_vote_/service/database_service.dart';

class faceVerfication3 extends StatefulWidget {
  final String voterId;

  const faceVerfication3({Key? key, required this.voterId}) : super(key: key);

  @override
  State<faceVerfication3> createState() => _faceVerfication3State();
}

class _faceVerfication3State extends State<faceVerfication3> {
  final ImagePicker picker = ImagePicker();
  bool isDetectingFace = false;
  File? _image;
  String result = "";
  String face_error = "Keep a hand distance with face and camera";
  String instr1 = "*Keep the phone straight to face";
  String instr2 = "*Keep maximum distance";
  dynamic faceDetector;

  @override
  void initState() {
    super.initState();
    // Initialize faceDetector in the initState method
    // imagePicker = ImagePicker();
    final options = FaceDetectorOptions(
        enableLandmarks: true,
        enableTracking: true,
        performanceMode: FaceDetectorMode.accurate);
    faceDetector = FaceDetector(options: options);
  }

  captureImages() async {
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        _image = File(image.path);
        doFaceRegister();
      });
    }
  }

  doFaceRegister() async {
    setState(() {
      isDetectingFace = true;
    });
    result = "";

    InputImage inputImage = InputImage.fromFile(_image!);

    final List<Face> faces = await faceDetector.processImage(inputImage);
    print("###########Faces :" + faces.length.toString());

    for (Face face in faces) {
      final Rect boundingBox = face.boundingBox;
      print("#####FACES:" + face.boundingBox.toString());
      if (face.boundingBox == 0) {
        face_error = "face not detected";
      } else {
        face_error = "";
        final double? rotX =
            face.headEulerAngleX; // Head is tilted up and down rotX degrees

        print("###X:" + rotX.toString());
        final double? rotY =
            face.headEulerAngleY; // Head is rotated to the right rotY degrees
        print("###X:" + rotY.toString());
        final double? rotZ =
            face.headEulerAngleZ; // Head is tilted sideways rotZ degrees
        print("###X:" + rotZ.toString());

        final FaceLandmark? leftEar = face.landmarks[FaceLandmarkType.leftEar];
        final FaceLandmark? rightEar =
            face.landmarks[FaceLandmarkType.rightEar];
        final FaceLandmark? leftEye = face.landmarks[FaceLandmarkType.leftEye];
        final FaceLandmark? rightEye =
            face.landmarks[FaceLandmarkType.rightEye];
        if (leftEar != null) {
          final Point<int> leftEarPos = leftEar.position;
          print("Left Ear Points:" + leftEarPos.toString());
          await DatabaseService().updateVoterField(
              widget.voterId, 'leftEar_3_X', leftEarPos.x.toString());
          await DatabaseService().updateVoterField(
              widget.voterId, 'leftEar_3_Y', leftEarPos.y.toString());
        }
        if (rightEar != null) {
          final Point<int> rightEarPos = rightEar.position;
          print("Right Ear Points:" + rightEarPos.toString());
          await DatabaseService().updateVoterField(
              widget.voterId, 'rightEar_3_X', rightEarPos.x.toString());
          await DatabaseService().updateVoterField(
              widget.voterId, 'rightEar_3_Y', rightEarPos.y.toString());
        }
        if (leftEye != null) {
          final Point<int> leftEyePos = leftEye.position;
          print("Left Eye Points:" + leftEyePos.toString());
          await DatabaseService().updateVoterField(
              widget.voterId, 'leftEye_3_X', leftEyePos.x.toString());
          await DatabaseService().updateVoterField(
              widget.voterId, 'leftEye_3_Y', leftEyePos.y.toString());
        }
        if (rightEye != null) {
          final Point<int> rightEyePos = rightEye.position;
          print("Right Eye Points:" + rightEyePos.toString());
          await DatabaseService().updateVoterField(
              widget.voterId, 'rightEye_3_X', rightEyePos.x.toString());
          await DatabaseService().updateVoterField(
              widget.voterId, 'rightEye_3_Y', rightEyePos.y.toString());
        }
        if (face.trackingId != null) {
          final int? id = face.trackingId;

          print("face id ::: ${id}");
        }
      }
    }
    setState(() {
      isDetectingFace = false;
    });
    setState(() {
      _image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
                child: Text("Face Registration",
                    style: TextStyle(fontSize: 36, color: Colors.blueAccent))),
            Center(
                child: Text("3/3",
                    style: TextStyle(fontSize: 20, color: Colors.blueAccent))),
          ],
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _image != null
                  ? Image.file(_image!)
                  : Icon(Icons.image, size: 150),
              Text(
                instr1, // Display face_error in Text widget
                style: TextStyle(color: Color.fromARGB(255, 0, 4, 243)),
                // Customize text color
              ),
              Text(
                instr2, // Display face_error in Text widget
                style: TextStyle(color: Color.fromARGB(255, 0, 4, 243)),
                // Customize text color
              ),
              Text(
                face_error, // Display face_error in Text widget
                style: TextStyle(color: Colors.red),
                // Customize text color
              ),
              ElevatedButton(
                onPressed: () {
                  captureImages();
                },
                child: Text("Capture"),
              ),
              if (isDetectingFace)
                Column(
                  children: [
                    CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Color.fromARGB(255, 1, 28, 180),
                      ),
                    ),
                    SizedBox(
                        height:
                            8), // Add some spacing between the text and the loading animation
                    Text(
                      "Detecting face...",
                      style: TextStyle(color: Color.fromARGB(255, 1, 28, 180)),
                    ),
                  ],
                ),
              if (face_error.isNotEmpty && isDetectingFace == false)
                Text(
                  'Face not detected',
                  style: TextStyle(color: Colors.red),
                ),
              if (face_error.isEmpty) // Render the button only if no face error
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SuccessFaceReg(
                                  voterId: widget.voterId,
                                )));
                  },
                  child: Text(
                    "Next",
                    style: TextStyle(
                        color: const Color.fromARGB(255, 0, 170, 255)),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
