// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Player {
  final String nickname;
  final String socketID;
  final int points;
  final String playerType;

  Player({required this.nickname,required this.socketID,required this.points,required this.playerType});


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nickname': nickname,
      'socketID': socketID,
      'points': points,
      'playerType': playerType,
    };
  }

  factory Player.fromMap(Map<String, dynamic> map) {
    return Player(
      nickname: map['nickname'] as String,
      socketID: map['socketID'] as String,
      points: map['points'] as int,
      playerType: map['playerType'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Player.fromJson(String source) => Player.fromMap(json.decode(source) as Map<String, dynamic>);

  Player copyWith({
    String? nickname,
    String? socketID,
    int? points,
    String? playerType,
  }) {
    return Player(
      nickname: nickname ?? this.nickname,
      socketID: socketID ?? this.socketID,
      points: points ?? this.points,
      playerType: playerType ?? this.playerType,
    );
  }
}
