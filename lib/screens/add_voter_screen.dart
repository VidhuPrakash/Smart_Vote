import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smart_vote_/firebase_services/auth_service.dart';
import 'package:smart_vote_/model/voter.dart';
import 'package:smart_vote_/reg_ui/face/face_1.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smart_vote_/service/database_service.dart';

class AddVoter extends StatefulWidget {
  const AddVoter({Key? key}) : super(key: key);

  @override
  _AddVoterState createState() => _AddVoterState();
}

class _AddVoterState extends State<AddVoter> {
  final DatabaseService _databaseService = DatabaseService();

  TextEditingController _nameController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _mobileController = TextEditingController();
  TextEditingController _voterIdController = TextEditingController();

  @override
  void initState() {
    super.initState();

    FirebaseFirestore firestore = FirebaseFirestore.instance;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('VOTER REGISTRATION'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _addressController,
                decoration: InputDecoration(
                  labelText: 'Address',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _mobileController,
                decoration: InputDecoration(
                  labelText: 'Mobile Number',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _voterIdController,
                decoration: InputDecoration(
                  labelText: 'Voter ID Number',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  addVoter();
                },
                child: Text('Next'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue, // Set button color to blue
                  minimumSize: Size(double.infinity, 50), // Set button size
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

// method for adding voter
  Future<void> addVoter() async {
    // Handle saving voter information
    String name = _nameController.text;
    String address = _addressController.text;
    String mobileNumber = _mobileController.text;
    String voterId = _voterIdController.text;

    // Perform actions with the collected data
    // For now, print the values
    print('Name: $name');
    print('Address: $address');
    print('Mobile Number: $mobileNumber');
    print('Voter ID: $voterId');

    if (name.isEmpty ||
        address.isEmpty ||
        mobileNumber.isEmpty ||
        voterId.isEmpty) {
      // Handle empty fields
    } else {
      Voter newVoter = Voter(
        name: name,
        address: address,
        number: mobileNumber,
        vId: voterId,
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

      _databaseService.addVoter(newVoter);

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => faceVerification(voterId: voterId)));
    }
  }
}
