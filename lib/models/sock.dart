class Sock {
  final String name;
  final String? description;
  final int size;
  final String owner;
  final String locationLost;

  Sock({
    required this.name,
    this.description,
    required this.size,
    required this.owner,
    required this.locationLost,
  });


  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'description': description,
      'size': size,
      'locationLost': locationLost,
      'owner': owner
    };
  }

  factory Sock.fromFirestore(Map<String, dynamic> map) {
    return Sock(
      name: map['name'],
      description: map['description'],
      size: map['size'],
      owner: map['owner'],
      locationLost: map['locationLost'],
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
