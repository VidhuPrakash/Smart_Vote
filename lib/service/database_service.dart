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
}
