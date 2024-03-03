import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:smart_vote_/service/database_service.dart';
import 'package:smart_vote_/voting_ui/face_verification.dart';

class QRverification extends StatefulWidget {
  const QRverification({Key? key}) : super(key: key);

  @override
  State<QRverification> createState() => _QRverificationState();
}

class _QRverificationState extends State<QRverification> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: (result != null)
                  ? Text(
                      'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}')
                  : Text('Scan a code'),
            ),
          )
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
        _verifyQRCode(result!.code as String);
      });
    });
  }

  void _verifyQRCode(String secretNumber) async {
    bool qrExists = await DatabaseService().checkQRIDExists(secretNumber);
    print("###Code####:" + qrExists.toString());

    if (qrExists) {
      // Navigate to face verification if QR ID found
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => faceVoteVerify(
                  qrId: secretNumber,
                )),
      );
    } else {
      // Show notification if QR ID not found
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Verification Result'),
            content: Text('You are not eligible for voting.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
