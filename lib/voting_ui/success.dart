import 'package:flutter/material.dart';
import 'package:smart_vote_/reg_ui/qr_code/qr.dart';
import 'package:smart_vote_/screens/login_screen.dart';

class SuccessVote extends StatelessWidget {
  const SuccessVote({Key? key}) : super(key: key);

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
              'Voting Successful!',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 40.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => Login()));
              },
              child: Text('Ok'),
            ),
          ],
        ),
      ),
    );
  }
}
