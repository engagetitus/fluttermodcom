// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';


class LeaveApp {
  final int id;
  final String jobgroup;
  final String contact;
  final String fname;
  final String lname;
  final DateTime date;
  LeaveApp({
    required this.id,
    required this.jobgroup,
    required this.contact,
    required this.fname,
    required this.lname,
    required this.date,
  });

  LeaveApp copyWith({
    int? id,
    String? jobgroup,
    String? contact,
    String? fname,
    String? lname,
    DateTime? date,
  }) {
    return LeaveApp(
      id: id ?? this.id,
      jobgroup: jobgroup ?? this.jobgroup,
      contact: contact ?? this.contact,
      fname: fname ?? this.fname,
      lname: lname ?? this.lname,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'jobgroup': jobgroup,
      'contact': contact,
      'fname': fname,
      'lname': lname,
      'date': date.millisecondsSinceEpoch,
    };
  }

  factory LeaveApp.fromMap(Map<String, dynamic> map) {
    return LeaveApp(
      id: map['id'] as int,
      jobgroup: map['jobgroup'] as String,
      contact: map['contact'] as String,
      fname: map['fname'] as String,
      lname: map['lname'] as String,
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory LeaveApp.fromJson(String source) => LeaveApp.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'LeaveApp(id: $id, jobgroup: $jobgroup, contact: $contact, fname: $fname, lname: $lname, date: $date)';
  }

  @override
  bool operator ==(covariant LeaveApp other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.jobgroup == jobgroup &&
      other.contact == contact &&
      other.fname == fname &&
      other.lname == lname &&
      other.date == date;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      jobgroup.hashCode ^
      contact.hashCode ^
      fname.hashCode ^
      lname.hashCode ^
      date.hashCode;
  }
}
