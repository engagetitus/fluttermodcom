// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Profile {
  // properties
  final String uid;
  final String fName;
  final String lName;
  final String email;
  final String phone;
  final String address;
  final String role;
  final String github;
  final String classId;
  final String courses;
  final String imageUrl;
  final DateTime createdAt;
  Profile({
    required this.uid,
    required this.fName,
    required this.lName,
    required this.email,
    required this.phone,
    required this.address,
    required this.role,
    required this.github,
    required this.classId,
    required this.courses,
    required this.imageUrl,
    required this.createdAt,
  });

  
  // create a methods to simplify our work
  
  Profile copyWith({
    String? uid,
    String? fName,
    String? lName,
    String? email,
    String? phone,
    String? address,
    String? role,
    String? github,
    String? classId,
    String? courses,
    String? imageUrl,
    DateTime? createdAt,
  }) {
    return Profile(
      uid: uid ?? this.uid,
      fName: fName ?? this.fName,
      lName: lName ?? this.lName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      address: address ?? this.address,
      role: role ?? this.role,
      github: github ?? this.github,
      classId: classId ?? this.classId,
      courses: courses ?? this.courses,
      imageUrl: imageUrl ?? this.imageUrl,
      createdAt: createdAt ?? this.createdAt,
    );
  }
//1. convert object to map - Database

  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'fName': fName,
      'lName': lName,
      'email': email,
      'phone': phone,
      'address': address,
      'role': role,
      'github': github,
      'classId': classId,
      'courses': courses,
      'imageUrl': imageUrl,
      'createdAt': createdAt.millisecondsSinceEpoch,
    };
  }
  //2. convert the map back to the object

  

  factory Profile.fromMap(Map<String, dynamic> map) {
    return Profile(
      uid: map['uid'] as String,
      fName: map['fName'] as String,
      lName: map['lName'] as String,
      email: map['email'] as String,
      phone: map['phone'] as String,
      address: map['address'] as String,
      role: map['role'] as String,
      github: map['github'] as String,
      classId: map['classId'] as String,
      courses: map['courses'] as String,
      imageUrl: map['imageUrl'] as String,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
    );
  }
  //3. convert top json  - send to API

  

  String toJson() => json.encode(toMap());

  factory Profile.fromJson(String source) => Profile.fromMap(json.decode(source) as Map<String, dynamic>);
//4. convert to a string - for debugging

  // CRUD METHODS
  @override
  String toString() {
    return 'User(uid: $uid, fName: $fName, lName: $lName, email: $email, phone: $phone, address: $address, role: $role, github: $github, classId: $classId, courses: $courses, imageUrl: $imageUrl, createdAt: $createdAt)';
  }

  @override
  bool operator ==(covariant Profile other) {
    if (identical(this, other)) return true;
  
    return 
      other.uid == uid &&
      other.fName == fName &&
      other.lName == lName &&
      other.email == email &&
      other.phone == phone &&
      other.address == address &&
      other.role == role &&
      other.github == github &&
      other.classId == classId &&
      other.courses == courses &&
      other.imageUrl == imageUrl &&
      other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
      fName.hashCode ^
      lName.hashCode ^
      email.hashCode ^
      phone.hashCode ^
      address.hashCode ^
      role.hashCode ^
      github.hashCode ^
      classId.hashCode ^
      courses.hashCode ^
      imageUrl.hashCode ^
      createdAt.hashCode;
  }
}
