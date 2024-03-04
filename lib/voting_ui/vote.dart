import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:smart_vote_/voting_ui/success.dart';

class VotingPage extends StatefulWidget {
  const VotingPage({Key? key}) : super(key: key);

  @override
  State<VotingPage> createState() => _VotingPageState();
}

class _VotingPageState extends State<VotingPage> {
  String selectedCandidate='';

  void _selectCandidate(String candidateName) {
    setState(() {
      selectedCandidate = candidateName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vote for Candidate'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 20),
          _buildCandidateRadio('Candidate 1'),
          _buildCandidateRadio('Candidate 2'),
          _buildCandidateRadio('Candidate 3'),
          _buildCandidateRadio('Candidate 4'),
          Expanded(
              child:
                  Container()), // To push the Confirm Vote button to the bottom
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                if (selectedCandidate != null) {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => SuccessVote()));
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Error'),
                        content: Text('Please select a candidate to vote.'),
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
              },
              child: Text('Confirm Vote'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCandidateRadio(String candidateName) {
    return RadioListTile<String>(
      title: Text(candidateName),
      value: candidateName,
      groupValue: selectedCandidate,
      onChanged: (value) {
        _selectCandidate(value!);
      },
    );
  }
}
