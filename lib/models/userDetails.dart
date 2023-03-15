class UserDetails {
  String location;
  String footSize;

  UserDetails({
    required this.location,
    required this.footSize,
  });

  Map<String, dynamic> toFirestore() {
    return {
      'location': location,
      'footSize': footSize,
    };
  }

  factory UserDetails.fromFirestore(Map<String, dynamic> map) {
    return UserDetails(location: map['location'], footSize: map['footSize']);
  }
}
