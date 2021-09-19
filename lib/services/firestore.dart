import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nosok/models/sock.dart';

class Firestore {
  static CollectionReference _socks =
      FirebaseFirestore.instance.collection('socks');

  static Stream<List<Sock>> sockStream(String uid) {
    return _socks.where('owner', isEqualTo: uid).snapshots().map(
          (snap) => snap.docs
              .map((doc) =>
                  Sock.fromFirestore(doc.data() as Map<String, dynamic>))
              .toList(),
        );
  }

  static Future<void> addSock(Sock sock) async {
    await _socks.add(sock.toFirestore());
  }
}
