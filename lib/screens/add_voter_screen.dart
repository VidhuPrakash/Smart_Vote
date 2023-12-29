import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smart_vote_/reg_ui/face/face_1.dart';

class AddVoter extends StatefulWidget {
  const AddVoter({Key? key}) : super(key: key);

  @override
  _AddVoterState createState() => _AddVoterState();
}

class _AddVoterState extends State<AddVoter> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _mobileController = TextEditingController();
  TextEditingController _voterIdController = TextEditingController();

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
                      voterId.isEmpty) {}
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => faceVerification()));
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
}
