import 'dart:math';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:smart_vote_/model/voter.dart';
import 'package:smart_vote_/service/database_service.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';

class QrScanner extends StatefulWidget {
  final String voterId;

  const QrScanner({Key? key, required this.voterId}) : super(key: key);

  @override
  State<QrScanner> createState() => _QrScannerState();
}

class _QrScannerState extends State<QrScanner> {
  String qrId = generateRandomQrId();
  late Voter voter = Voter(
    name: '',
    address: '',
    number: '',
    vId: '',
    qrId: '',
    leftEar_1_X: '',
    leftEar_1_Y: '',
    leftEar_2_X: '',
    leftEar_2_Y: '',
    leftEar_3_X: '',
    leftEar_3_Y: '',
    rightEar_1_X: '',
    rightEar_1_Y: '',
    rightEar_2_X: '',
    rightEar_2_Y: '',
    rightEar_3_X: '',
    rightEar_3_Y: '',
    leftEye_1_X: '',
    leftEye_1_Y: '',
    leftEye_2_X: '',
    leftEye_2_Y: '',
    leftEye_3_X: '',
    leftEye_3_Y: '',
    rightEye_1_X: '',
    rightEye_1_Y: '',
    rightEye_2_X: '',
    rightEye_2_Y: '',
    rightEye_3_X: '',
    rightEye_3_Y: '',
  );

  @override
  void initState() {
    super.initState();
    _updateVoterQrId();
    _fetchVoterData();
  }

  Future<void> _updateVoterQrId() async {
    await DatabaseService()
        .updateVoterField(widget.voterId, 'qrId', qrId.toString());
  }

  Future<void> _fetchVoterData() async {
    Voter? fetchedVoter = await DatabaseService().getVoterById(widget.voterId);

    if (fetchedVoter != null) {
      setState(() {
        voter = fetchedVoter;
      });
    } else {
      Fluttertoast.showToast(
          msg: "Failed to fetch voter data",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  Future<void> _saveQrCode() async {
    try {
      // Convert QR code widget to image
      final image = await QrPainter(
        data: qrId,
        version: QrVersions.auto,
        gapless: false,
      ).toImage(300);

      // Convert image to bytes
      ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);

      if (byteData != null) {
        Uint8List pngBytes = byteData.buffer.asUint8List();

        // Create an image with voter name
        Uint8List finalImageBytes =
            await _createImageWithVoterName(voter.name, pngBytes);

        // Save image to gallery
        final result = await ImageGallerySaver.saveImage(finalImageBytes);

        if (result['isSuccess']) {
          Fluttertoast.showToast(
            msg: "QR Code saved with voter name",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Color.fromARGB(105, 54, 89, 244),
            textColor: Colors.white,
            fontSize: 16.0,
          );
        } else {
          Fluttertoast.showToast(
            msg: "Failed to save QR Code with voter name",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        }
      } else {
        Fluttertoast.showToast(
          msg: "Error converting byte code to image",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
    } catch (e) {
      print('####Error saving QR Code: $e');
      Fluttertoast.showToast(
        msg: "Error saving QR Code with voter name",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  Future<bool> _requestStoragePermission() async {
    var status = await Permission.storage.status;
    if (status.isDenied) {
      status = await Permission.storage.request();
    }
    return status.isGranted;
  }

  Future<Uint8List> _createImageWithVoterName(
      String voterName, Uint8List qrCodeImage) async {
    final recorder = ui.PictureRecorder();
    final canvasSize = MediaQuery.of(context).size; // Get the screen size
    final canvas = Canvas(recorder);
    final paint = Paint();

    paint.color = Colors.white;
    canvas.drawRect(
        Rect.fromPoints(
            Offset(0, 0), Offset(canvasSize.width, canvasSize.height)),
        paint);

    final codec = await ui.instantiateImageCodec(qrCodeImage);
    final frameInfo = await codec.getNextFrame();
    paintImage(
      canvas: canvas,
      image: frameInfo.image,
      rect: Rect.fromPoints(
          Offset(0, 0), Offset(canvasSize.width, canvasSize.height)),
      scale: 1.0,
    );

    paint.color = Colors.black;
    final textPainter = TextPainter(
      text: TextSpan(
        text: voterName,
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(minWidth: canvasSize.width, maxWidth: canvasSize.width);
    textPainter.paint(
        canvas,
        Offset(
            10,
            canvasSize.height -
                90)); // Adjust the Y coordinate based on your layout

    paint.color = Colors.green;
    const tickSize = 30.0;
    canvas.drawCircle(
        Offset(canvasSize.width - 30, canvasSize.height - 30), tickSize, paint);
    paint.color = Colors.white;
    canvas.drawCircle(Offset(canvasSize.width - 30, canvasSize.height - 30),
        tickSize - 5, paint);
    _drawCheckIcon(
        canvas,
        Offset(canvasSize.width - 30 - tickSize / 2,
            canvasSize.height - 30 - tickSize / 2));

    final picture = recorder.endRecording();
    final img = await picture.toImage(
        canvasSize.width.toInt(), canvasSize.height.toInt());
    final ByteData? byteData =
        await img.toByteData(format: ui.ImageByteFormat.png);
    final pngBytes = byteData?.buffer.asUint8List() ?? Uint8List(0);

    return pngBytes;
  }

  void _drawCheckIcon(Canvas canvas, Offset position) {
    final paint = Paint();
    paint.color = Colors.green;
    paint.style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(position.dx - 12, position.dy + 5);
    path.lineTo(position.dx - 4, position.dy + 12);
    path.lineTo(position.dx + 14, position.dy - 8);

    canvas.drawPath(path, paint);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Display voter name with a small tick logo
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(voter.name ?? '', style: TextStyle(fontSize: 20)),
              Icon(Icons.check, color: Colors.green, size: 24),
            ],
          ),
          SizedBox(height: 10),
          Center(
            child: QrImageView(
              data: qrId,
              version: QrVersions.auto,
              size: 300.0,
            ),
          ),
          SizedBox(height: 24),
          ElevatedButton(
            onPressed: _saveQrCode,
            child: Text('Download QR Code'),
          ),
          SizedBox(
            height: 24.0,
          ),

          ElevatedButton(
            onPressed: () {
              // Navigate back to the menu
              Navigator.popAndPushNamed(context, '/home');
            },
            style: ElevatedButton.styleFrom(
              primary: ui.Color.fromARGB(
                  255, 247, 74, 241), // Set the background color
            ),
            child: Text(
              'Back to Menu',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}

String generateRandomQrId() {
  int randomVoterId = 100000 + Random().nextInt(900000);
  return 'Voter_$randomVoterId';
}
