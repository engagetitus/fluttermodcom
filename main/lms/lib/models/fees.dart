// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Fees {
  final String id;
  final String userId;
  final double amount;
  final String reference;
  final bool isCredt; // true if fee has been paid
  final DateTime createdOn;
  final bool isApproved;
  Fees({
    required this.id,
    required this.userId,
    required this.amount,
    required this.reference,
    required this.isCredt,
    required this.createdOn,
    required this.isApproved,
  });

  Fees copyWith({
    String? id,
    String? userId,
    double? amount,
    String? reference,
    bool? isCredt,
    DateTime? createdOn,
    bool? isApproved,
  }) {
    return Fees(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      amount: amount ?? this.amount,
      reference: reference ?? this.reference,
      isCredt: isCredt ?? this.isCredt,
      createdOn: createdOn ?? this.createdOn,
      isApproved: isApproved ?? this.isApproved,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'userId': userId,
      'amount': amount,
      'reference': reference,
      'isCredt': isCredt,
      'createdOn': createdOn.millisecondsSinceEpoch,
      'isApproved': isApproved,
    };
  }

  factory Fees.fromMap(Map<String, dynamic> map) {
    return Fees(
      id: map['id'] as String,
      userId: map['userId'] as String,
      amount: map['amount'] as double,
      reference: map['reference'] as String,
      isCredt: map['isCredt'] as bool,
      createdOn: DateTime.fromMillisecondsSinceEpoch(map['createdOn'] as int),
      isApproved: map['isApproved'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Fees.fromJson(String source) =>
      Fees.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Fees(id: $id, userId: $userId, amount: $amount, reference: $reference, isCredt: $isCredt, createdOn: $createdOn, isApproved: $isApproved)';
  }

  @override
  bool operator ==(covariant Fees other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.userId == userId &&
        other.amount == amount &&
        other.reference == reference &&
        other.isCredt == isCredt &&
        other.createdOn == createdOn &&
        other.isApproved == isApproved;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        userId.hashCode ^
        amount.hashCode ^
        reference.hashCode ^
        isCredt.hashCode ^
        createdOn.hashCode ^
        isApproved.hashCode;
  }
}
