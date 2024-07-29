// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Fees {
  final String id;
  final String userId;
  final double amount;
  final String reference;
  final bool isCredit; //true if fee has been paid
  final DateTime createdOn;
  final bool isApproved;

  Fees(
    this.id,
    this.userId,
    this.amount,
    this.reference,
    this.isCredit,
    this.createdOn,
    this.isApproved,
  );
  

  Fees copyWith({
    String? id,
    String? userId,
    double? amount,
    String? reference,
    bool? isCredit,
    DateTime? createdOn,
    bool? isApproved,
  }) {
    return Fees(
      id ?? this.id,
      userId ?? this.userId,
      amount ?? this.amount,
      reference ?? this.reference,
      isCredit ?? this.isCredit,
      createdOn ?? this.createdOn,
      isApproved ?? this.isApproved,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'userId': userId,
      'amount': amount,
      'reference': reference,
      'isCredit': isCredit,
      'createdOn': createdOn.millisecondsSinceEpoch,
      'isApproved': isApproved,
    };
  }

  factory Fees.fromMap(Map<String, dynamic> map) {
    return Fees(
      map['id'] as String,
      map['userId'] as String,
      map['amount'] as double,
      map['reference'] as String,
      map['isCredit'] as bool,
      DateTime.fromMillisecondsSinceEpoch(map['createdOn'] as int),
      map['isApproved'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Fees.fromJson(String source) => Fees.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Fees(id: $id, userId: $userId, amount: $amount, reference: $reference, isCredit: $isCredit, createdOn: $createdOn, isApproved: $isApproved)';
  }

  @override
  bool operator ==(covariant Fees other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.userId == userId &&
      other.amount == amount &&
      other.reference == reference &&
      other.isCredit == isCredit &&
      other.createdOn == createdOn &&
      other.isApproved == isApproved;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      userId.hashCode ^
      amount.hashCode ^
      reference.hashCode ^
      isCredit.hashCode ^
      createdOn.hashCode ^
      isApproved.hashCode;
  }
}
