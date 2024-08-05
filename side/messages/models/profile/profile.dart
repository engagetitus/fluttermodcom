// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Profile {
  final String id;
  final String fname;
  final String lname;
  final String phone;
  final bool verified;
  final DateTime createdAt;
  final String imageurl;

  Profile(
    this.id,
    this.fname,
    this.lname,
    this.phone,
    this.verified,
    this.createdAt,
    this.imageurl,
  );





  Profile copyWith({
    String? id,
    String? fname,
    String? lname,
    String? phone,
    bool? verified,
    DateTime? createdAt,
    String? imageurl,
  }) {
    return Profile(
      id ?? this.id,
      fname ?? this.fname,
      lname ?? this.lname,
      phone ?? this.phone,
      verified ?? this.verified,
      createdAt ?? this.createdAt,
      imageurl ?? this.imageurl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'fname': fname,
      'lname': lname,
      'phone': phone,
      'verified': verified,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'imageurl': imageurl,
    };
  }

  factory Profile.fromMap(Map<String, dynamic> map) {
    return Profile(
      map['id'] as String,
      map['fname'] as String,
      map['lname'] as String,
      map['phone'] as String,
      map['verified'] as bool,
      DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
      map['imageurl'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Profile.fromJson(String source) => Profile.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Profile(id: $id, fname: $fname, lname: $lname, phone: $phone, verified: $verified, createdAt: $createdAt, imageurl: $imageurl)';
  }

  @override
  bool operator ==(covariant Profile other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.fname == fname &&
      other.lname == lname &&
      other.phone == phone &&
      other.verified == verified &&
      other.createdAt == createdAt &&
      other.imageurl == imageurl;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      fname.hashCode ^
      lname.hashCode ^
      phone.hashCode ^
      verified.hashCode ^
      createdAt.hashCode ^
      imageurl.hashCode;
  }
}
