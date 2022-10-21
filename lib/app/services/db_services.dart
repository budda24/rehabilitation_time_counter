import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_complete_guide/app/data/rehabilitation.dart';

class FirebaseDB {
  var db = FirebaseFirestore.instance;
  Future<List<Rehabilitation>> getRehabilitation() async {
    var rehabilitationFromFirestore =
        await db.collection('rehabilitation').get();
    if (rehabilitationFromFirestore.docs.isNotEmpty) {
      return rehabilitationFromFirestore.docs
          .map((e) => Rehabilitation.fromJson(e.data()))
          .toList();
    } else {
      return [];
    }
  }

  Future<void> saveRehabilitation(Rehabilitation rehabilitation) async {
    await db
        .collection('rehabilitation')
        .doc(rehabilitation.id)
        .set(rehabilitation.toJson());
  }

  deleteRehabilitation(Rehabilitation rehabilitation) async {
    await db.collection('rehabilitation').doc(rehabilitation.id).delete();
  }

  Future<double> getHourSpent() async {
    var snapshot = await db.collection('time').doc('spent_hour').get();
    if (snapshot.exists) {
      return snapshot.data()!['hour_left'];
    }
    return 0.0;
  }

  updateHourSpent(double hourLeft) async {
    await db.collection('time').doc('spent_hour').set({'hour_left': hourLeft});
  }
}
