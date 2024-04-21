import 'package:flutter/material.dart';
import 'package:tik_tac_toe_online/resources/socket_client.dart';
import 'package:tik_tac_toe_online/screens/game_screens.dart';

class SocketMethods {
  final _socketClient = SocketClient.instance.socket!;

  void createRoom(String nickname) {

    if (nickname.isNotEmpty) {
  
      _socketClient.emit('createRoom', {'nickname': nickname});

    }
  }

  void createRoomSuccessListener(BuildContext context){
    _socketClient.on('createdRoomSuccess',(room){

      Navigator.pushNamed(context, GameScreen.routeName);
    });
  }
}
