// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Message {
  final String id;
  final String message;
  final String senderId;
  final String senderName;
  final String receiptId;
  final bool read;
  final DateTime createdAt;
  final bool View;

  Message(
    this.id,
    this.message,
    this.senderId,
    this.senderName,
    this.receiptId,
    this.read,
    this.createdAt,
    this.View,
  );

  Message copyWith({
    String? id,
    String? message,
    String? senderId,
    String? senderName,
    String? receiptId,
    bool? read,
    DateTime? createdAt,
    bool? View,
  }) {
    return Message(
      id ?? this.id,
      message ?? this.message,
      senderId ?? this.senderId,
      senderName ?? this.senderName,
      receiptId ?? this.receiptId,
      read ?? this.read,
      createdAt ?? this.createdAt,
      View ?? this.View,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'message': message,
      'senderId': senderId,
      'senderName': senderName,
      'receiptId': receiptId,
      'read': read,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'View': View,
    };
  }

  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
      map['id'] as String,
      map['message'] as String,
      map['senderId'] as String,
      map['senderName'] as String,
      map['receiptId'] as String,
      map['read'] as bool,
      DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
      map['View'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Message.fromJson(String source) => Message.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Message(id: $id, message: $message, senderId: $senderId, senderName: $senderName, receiptId: $receiptId, read: $read, createdAt: $createdAt, View: $View)';
  }

  @override
  bool operator ==(covariant Message other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.message == message &&
      other.senderId == senderId &&
      other.senderName == senderName &&
      other.receiptId == receiptId &&
      other.read == read &&
      other.createdAt == createdAt &&
      other.View == View;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      message.hashCode ^
      senderId.hashCode ^
      senderName.hashCode ^
      receiptId.hashCode ^
      read.hashCode ^
      createdAt.hashCode ^
      View.hashCode;
  }
}
