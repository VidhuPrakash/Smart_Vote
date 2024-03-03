import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smart_vote_/screens/add_voter_screen.dart';
import 'package:smart_vote_/screens/create_poll_screen.dart';
import 'package:smart_vote_/screens/login_screen.dart';
import 'package:smart_vote_/voting_ui/qr_vote.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Login()),
              );
            },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Logo placeholder (replace with your logo)
          Container(
            height: 150.0,
            child: Image.asset('assets/logo.png'), // Replace with your logo
          ),
          SizedBox(height: 50),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.lightBlue,
              minimumSize: Size(double.infinity, 50), // Set button size
            ),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => AddVoter()));
            },
            child: Text("Add New Voter"),
          ),
          SizedBox(height: 30),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.lightBlue,
              minimumSize: Size(double.infinity, 50), // Set button size
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CreatePollHome()));
            },
            child: Text("Create Polling"),
          ),
          SizedBox(height: 30),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.blue,
              minimumSize: Size(double.infinity, 50), // Set button size
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => QRverification()));
            },
            child: Text("Vote"),
          ),
        ],
      ),
    );
  }
}
