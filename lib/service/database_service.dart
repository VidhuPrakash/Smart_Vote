import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smart_vote_/model/voter.dart';

const String VOTER_COLLECTION_REF = 'voter';

class DatabaseService {
  final _firestore = FirebaseFirestore.instance;
  late final CollectionReference _voterRef;
  DatabaseService() {
    _voterRef =
        _firestore.collection(VOTER_COLLECTION_REF).withConverter<Voter>(
            fromFirestore: (snapshots, _) => Voter.fromJson(
                  snapshots.data()!,
                ),
            toFirestore: (voter, _) => voter.toJson());
  }
  Stream<QuerySnapshot> getVoters() {
    return _voterRef.snapshots();
  }

  void addVoter(Voter voter) async {
    _voterRef.doc(voter.vId).set(voter);
  }

  Future<Voter?> getVoterById(String voterId) async {
    try {
      final DocumentSnapshot voterDoc = await _voterRef.doc(voterId).get();

      if (voterDoc.exists) {
        return voterDoc.data() as Voter;
      } else {
        print('Document does not exist for voterId: $voterId');
        return null;
      }
    } catch (e) {
      print('Error fetching voter data: $e');
      return null;
    }
  }

  Future<bool> checkQRIDExists(String qrId) async {
    try {
      final QuerySnapshot querySnapshot =
          await _voterRef.where('qrId', isEqualTo: qrId).get();

      return true;
    } catch (e) {
      print('Error checking QRID: $e');
      return false;
    }
  }

  Future<void> updateVoterField(
      String voterId, String field, String value) async {
    final DocumentReference voterDoc = _voterRef.doc(voterId);

    final currentVoterSnapshot = await voterDoc.get();

    if (currentVoterSnapshot.exists) {
      final Voter currentVoter = currentVoterSnapshot.data()! as Voter;
      final updatedData = currentVoter.toJson()..[field] = value;

      await voterDoc.update(updatedData);
    } else {
      // Handle the case where the document doesn't exist
      print('Document does not exist for voterId: $voterId');
    }
  }

  Future<bool> leftEar_1_Xverify(String qrId, String Data) async {
    try {
      final DocumentSnapshot voterDoc = await _voterRef.doc(qrId).get();

      if (voterDoc.exists) {
        final Voter retrievedVoter = voterDoc.data() as Voter;

        // Compare specific attributes of the voters
        if (retrievedVoter.leftEar_1_X == Data &&
           int.parse( retrievedVoter.leftEar_1_X) <= int.parse(Data) + 250 
           || retrievedVoter.leftEar_2_X == Data &&
            int.parse(retrievedVoter.leftEar_2_X) <= int.parse(Data) + 250 
            ||retrievedVoter.leftEar_3_X == Data &&
            int.parse(retrievedVoter.leftEar_3_X) <= int.parse(Data) + 250 ) {
          return true; // Voter data matches
        } else {
          return false; // Voter data doesn't match
        }
      } else {
        print('Document does not exist for voterId: $qrId');
        return false;
      }
    } catch (e) {
      print('Error comparing voter data: $e');
      return false;
    }
  }

  Future<bool> leftEar_1_Yverify(String qrId, String Data) async {
    try {
      final DocumentSnapshot voterDoc = await _voterRef.doc(qrId).get();

      if (voterDoc.exists) {
        final Voter retrievedVoter = voterDoc.data() as Voter;

        // Compare specific attributes of the voters
        if (retrievedVoter.leftEar_1_Y == Data &&
            int.parse(retrievedVoter.leftEar_1_Y) <= int.parse(Data) + 250 
            || retrievedVoter.leftEar_2_Y == Data &&
            int.parse(retrievedVoter.leftEar_1_Y) <= int.parse(Data) + 250  ||
            retrievedVoter.leftEar_3_Y == Data &&
            int.parse(retrievedVoter.leftEar_1_Y) <= int.parse(Data) + 250 
            ) {
          return true; // Voter data matches
        } else {
          return false; // Voter data doesn't match
        }
      } else {
        print('Document does not exist for voterId: $qrId');
        return false;
      }
    } catch (e) {
      print('Error comparing voter data: $e');
      return false;
    }
  }

  Future<bool> leftEye_1_Xverify(String qrId, String Data) async {
    try {
      final DocumentSnapshot voterDoc = await _voterRef.doc(qrId).get();

      if (voterDoc.exists) {
        final Voter retrievedVoter = voterDoc.data() as Voter;

        // Compare specific attributes of the voters
        if (retrievedVoter.leftEye_1_X == Data &&
            int.parse(retrievedVoter.leftEar_1_Y) <= int.parse(Data) + 250 
            || retrievedVoter.leftEye_2_X == Data &&
            int.parse(retrievedVoter.leftEar_1_Y) <= int.parse(Data) + 250  ||
            retrievedVoter.leftEye_3_X == Data &&
            int.parse(retrievedVoter.leftEar_1_Y) <= int.parse(Data) + 250 
            ) {
          return true; // Voter data matches
        } else {
          return false; // Voter data doesn't match
        }
      } else {
        print('Document does not exist for voterId: $qrId');
        return false;
      }
    } catch (e) {
      print('Error comparing voter data: $e');
      return false;
    }
  }

  Future<bool> leftEye_1_Yverify(String qrId, String Data) async {
    try {
      final DocumentSnapshot voterDoc = await _voterRef.doc(qrId).get();

      if (voterDoc.exists) {
        final Voter retrievedVoter = voterDoc.data() as Voter;

        // Compare specific attributes of the voters
        if (retrievedVoter.leftEye_1_Y == Data &&
            int.parse(retrievedVoter.leftEar_1_Y) <= int.parse(Data) + 250 
            || retrievedVoter.leftEye_2_Y == Data &&
            int.parse(retrievedVoter.leftEar_1_Y) <= int.parse(Data) + 250  ||
            retrievedVoter.leftEye_3_Y == Data &&
            int.parse(retrievedVoter.leftEar_1_Y) <= int.parse(Data) + 250 
            ) {
          return true; // Voter data matches
        } else {
          return false; // Voter data doesn't match
        }
      } else {
        print('Document does not exist for voterId: $qrId');
        return false;
      }
    } catch (e) {
      print('Error comparing voter data: $e');
      return false;
    }
  }

  Future<bool> rightEar_1_Xverify(String qrId, String Data) async {
    try {
      final DocumentSnapshot voterDoc = await _voterRef.doc(qrId).get();

      if (voterDoc.exists) {
        final Voter retrievedVoter = voterDoc.data() as Voter;

        // Compare specific attributes of the voters
        if (retrievedVoter.rightEar_1_X == Data &&
            int.parse(retrievedVoter.rightEar_1_X) <= int.parse(Data) + 250 
            || retrievedVoter.rightEar_2_X == Data &&
            int.parse(retrievedVoter.rightEar_2_X) <= int.parse(Data) + 250  ||
            retrievedVoter.rightEar_3_X == Data &&
            int.parse(retrievedVoter.rightEar_3_X) <= int.parse(Data) + 250 
            ) {
          return true; // Voter data matches
        } else {
          return false; // Voter data doesn't match
        }
      } else {
        print('Document does not exist for voterId: $qrId');
        return false;
      }
    } catch (e) {
      print('Error comparing voter data: $e');
      return false;
    }
  }

  Future<bool> rightEar_1_Yverify(String qrId, String Data) async {
    try {
      final DocumentSnapshot voterDoc = await _voterRef.doc(qrId).get();

      if (voterDoc.exists) {
        final Voter retrievedVoter = voterDoc.data() as Voter;

        // Compare specific attributes of the voters
        if (retrievedVoter.rightEar_1_Y == Data &&
            int.parse(retrievedVoter.rightEar_1_Y) <= int.parse(Data) + 250 
            || retrievedVoter.rightEar_2_Y == Data &&
            int.parse(retrievedVoter.rightEar_2_Y) <= int.parse(Data) + 250  ||
            retrievedVoter.rightEar_3_Y == Data &&
            int.parse(retrievedVoter.rightEar_3_Y) <= int.parse(Data) + 250 
           ) {
          return true; // Voter data matches
        } else {
          return false; // Voter data doesn't match
        }
      } else {
        print('Document does not exist for voterId: $qrId');
        return false;
      }
    } catch (e) {
      print('Error comparing voter data: $e');
      return false;
    }
  }

  Future<bool> rightEye_1_Xverify(String qrId, String Data) async {
    try {
      final DocumentSnapshot voterDoc = await _voterRef.doc(qrId).get();

      if (voterDoc.exists) {
        final Voter retrievedVoter = voterDoc.data() as Voter;

        // Compare specific attributes of the voters
        if (retrievedVoter.rightEye_1_X == Data &&
            int.parse(retrievedVoter.rightEye_1_X) <= int.parse(Data) + 250 
            || retrievedVoter.rightEye_2_X == Data &&
            int.parse(retrievedVoter.rightEye_2_X) <= int.parse(Data) + 250  ||
            retrievedVoter.rightEye_3_X == Data &&
            int.parse(retrievedVoter.rightEye_3_X) <= int.parse(Data) + 250 
           ) {
          return true; // Voter data matches
        } else {
          return false; // Voter data doesn't match
        }
      } else {
        print('Document does not exist for voterId: $qrId');
        return false;
      }
    } catch (e) {
      print('Error comparing voter data: $e');
      return false;
    }
  }

  Future<bool> rightEye_1_Yverify(String qrId, String Data) async {
    try {
      final DocumentSnapshot voterDoc = await _voterRef.doc(qrId).get();

      if (voterDoc.exists) {
        final Voter retrievedVoter = voterDoc.data() as Voter;

        // Compare specific attributes of the voters
        if (retrievedVoter.rightEye_1_Y == Data &&
            int.parse(retrievedVoter.rightEye_1_Y) <= int.parse(Data) + 250 
            || retrievedVoter.rightEye_2_Y == Data &&
            int.parse(retrievedVoter.rightEye_2_Y) <= int.parse(Data) + 250  ||
            retrievedVoter.rightEye_3_Y == Data &&
            int.parse(retrievedVoter.rightEye_3_Y) <= int.parse(Data) + 250 
           ) {
          return true; // Voter data matches
        } else {
          return false; // Voter data doesn't match
        }
      } else {
        print('Document does not exist for voterId: $qrId');
        return false;
      }
    } catch (e) {
      print('Error comparing voter data: $e');
      return false;
    }
  }
}
