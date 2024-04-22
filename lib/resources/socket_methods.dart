import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tik_tac_toe_online/provider/room_data_provider.dart';
import 'package:tik_tac_toe_online/resources/socket_client.dart';
import 'package:tik_tac_toe_online/screens/game_screens.dart';

class SocketMethods {
  final _socketClient = SocketClient.instance.socket!;


  //Socket on server to create room game
  void createRoom(String nickname) {
    if (nickname.isNotEmpty) {
      _socketClient.emit('createRoom', {'nickname': nickname});
    }
  }


//receive from server info the room
  void createRoomSuccessListener(BuildContext context){
    _socketClient.on('createdRoomSuccess',(room){
      Provider.of<RoomDataProvider>(context, listen: false).updateRoomData(room);
      Navigator.pushNamed(context, GameScreen.routeName);
    });
  }
}
