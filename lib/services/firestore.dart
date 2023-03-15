import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nosok/models/sock.dart';
import 'package:nosok/models/userDetails.dart';

class Firestore {
  static CollectionReference _socks =
      FirebaseFirestore.instance.collection('socks');
  static CollectionReference _userDetails =
      FirebaseFirestore.instance.collection('user_details');

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

  static Future<void> saveUserDetails(
      String? uid, String? location, String? footSize) {
    if (uid == null) {
      throw Exception('User ID not found.');
    } else if (location == null || footSize == null) {
      throw Exception('Not all fields were provided.');
    }

    return _userDetails.doc(uid).set({
      'location': location,
      'footSize': footSize,
    });
  }

  static UserDetails getUserDetails(String? uid) {
    if (uid == null) {
      throw Exception('User ID not found.');
    }

    return UserDetails.fromFirestore(
        _userDetails.doc(uid).get() as Map<String, dynamic>);
  }
}
