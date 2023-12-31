import 'package:flutter/material.dart';
import 'package:smart_vote_/reg_ui/qr_code/qr.dart';

class SuccessFaceReg extends StatelessWidget {
  final String voterId;
  const SuccessFaceReg({Key? key, required this.voterId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle_outline, // Checkmark icon
              color: Colors.green,
              size: 100.0,
            ),
            SizedBox(height: 20.0),
            Text(
              'Face Successfully Registered!',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 40.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => QrScanner(voterId: voterId)));
              },
              child: Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }
}
