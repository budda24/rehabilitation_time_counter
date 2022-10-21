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
    await db.collection('rehabilitation').add(rehabilitation.toJson());
  }

  deleteRehabilitation() async {
    var rehabilitationSnapshot = await getRehabilitation();

  }
}
