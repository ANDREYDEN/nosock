class Sock {
  final String name;
  final String? description;
  final int size;
  final String owner;
  final String locationLost;
  List<String> photoUrls;

  Sock({
    required this.name,
    this.description,
    required this.size,
    required this.owner,
    required this.locationLost,
    this.photoUrls = const [],
  });

  String? get preview => photoUrls.isEmpty ? null : photoUrls.first;


  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'description': description,
      'size': size,
      'locationLost': locationLost,
      'owner': owner,
      'photoUrls': photoUrls
    };
  }

  factory Sock.fromFirestore(Map<String, dynamic> map) {
    return Sock(
      name: map['name'],
      description: map['description'],
      size: map['size'],
      owner: map['owner'],
      locationLost: map['locationLost'],
      photoUrls: map['photoUrls'].map<String>((url) => url.toString()).toList()
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Sock &&
      other.name == name &&
      other.description == description &&
      other.size == size &&
      other.locationLost == locationLost;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      description.hashCode ^
      size.hashCode ^
      locationLost.hashCode;
  }
}
