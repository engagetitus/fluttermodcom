// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Message {
  final String id;
  final String senderId;
  final String senderName;
  final String receiptId;
  final String text;
  final bool isRead;
  final bool view;
  final DateTime createdAt;
  Message({
    required this.id,
    required this.senderId,
    required this.senderName,
    required this.receiptId,
    required this.text,
    required this.isRead,
    required this.view,
    required this.createdAt,
  });

  Message copyWith({
    String? id,
    String? senderId,
    String? senderName,
    String? receiptId,
    String? text,
    bool? isRead,
    bool? view,
    DateTime? createdAt,
  }) {
    return Message(
      id: id ?? this.id,
      senderId: senderId ?? this.senderId,
      senderName: senderName ?? this.senderName,
      receiptId: receiptId ?? this.receiptId,
      text: text ?? this.text,
      isRead: isRead ?? this.isRead,
      view: view ?? this.view,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'senderId': senderId,
      'senderName': senderName,
      'receiptId': receiptId,
      'text': text,
      'isRead': isRead,
      'view': view,
      'createdAt': createdAt.millisecondsSinceEpoch,
    };
  }

  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
      id: map['id'] as String,
      senderId: map['senderId'] as String,
      senderName: map['senderName'] as String,
      receiptId: map['receiptId'] as String,
      text: map['text'] as String,
      isRead: map['isRead'] as bool,
      view: map['view'] as bool,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory Message.fromJson(String source) =>
      Message.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Message(id: $id, senderId: $senderId, senderName: $senderName, receiptId: $receiptId, text: $text, isRead: $isRead, view: $view, createdAt: $createdAt)';
  }

  @override
  bool operator ==(covariant Message other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.senderId == senderId &&
      other.senderName == senderName &&
      other.receiptId == receiptId &&
      other.text == text &&
      other.isRead == isRead &&
      other.view == view &&
      other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      senderId.hashCode ^
      senderName.hashCode ^
      receiptId.hashCode ^
      text.hashCode ^
      isRead.hashCode ^
      view.hashCode ^
      createdAt.hashCode;
  }
}
