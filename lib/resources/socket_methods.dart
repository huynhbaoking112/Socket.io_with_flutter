import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tik_tac_toe_online/provider/room_data_provider.dart';
import 'package:tik_tac_toe_online/resources/socket_client.dart';
import 'package:tik_tac_toe_online/screens/game_screens.dart';
import 'package:tik_tac_toe_online/utils/show_snack_bar.dart';

class SocketMethods {
  final _socketClient = SocketClient.instance.socket!;

  //Emits
  //Socket on server to create room game
  void createRoom(String nickname) {
    if (nickname.isNotEmpty) {
      _socketClient.emit('createRoom', {'nickname': nickname});
    }
  }

  //Join Room
  void joinRoom(String nickname, String roomId) {
    if (nickname.isNotEmpty && roomId.isNotEmpty) {
      _socketClient.emit('joinRoom', {'nickname': nickname, 'roomId': roomId});
    }
  }

//Listerner
//receive from server info the room
  void createRoomSuccessListener(BuildContext context) {
    _socketClient.on('createdRoomSuccess', (room) {
      Provider.of<RoomDataProvider>(context, listen: false)
          .updateRoomData(room);
      Navigator.pushNamed(context, GameScreen.routeName);
    });
  }

//join room success
  void joinRoomSuccessListener(BuildContext context) {
    //Room not exists
    _socketClient.on('roomNotExists', (_) {
      // showDialog(
      //   context: context,
      //   builder: (context) {
      //     return AlertDialog(
      //       title: Text("Room not exists"),
      //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      //       actions: [
      //         TextButton(onPressed: (){  Navigator.pop(context); }, child: Text("Try again"))
      //       ],
      //     );
      //   },
      // );

      showSnackBar(context, "Room not exists");
    });

    //roomfull
    _socketClient.on('roomFull', (_) {
      // showDialog(
      //   context: context,
      //   builder: (context) {
      //     return AlertDialog(
      //       title: Text("The game is starting"),
      //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      //       actions: [
      //         TextButton(onPressed: (){  Navigator.pop(context); }, child: Text("Try again"))
      //       ],
      //     );
      //   },
      // );
      showSnackBar(context, "The game is starting");
    });

    _socketClient.on('joinRoomSuccess', (room) {
      Provider.of<RoomDataProvider>(context, listen: false)
          .updateRoomData(room);
      Navigator.pushNamed(context, GameScreen.routeName);
    });
  }

//Functions update player
void updatePlayersListener(BuildContext context){
  _socketClient.on('updatePlayers', (room) {
    Provider.of<RoomDataProvider>(context, listen: false).updatePlayer1((room['player'])[0]);
    Provider.of<RoomDataProvider>(context, listen: false).updatePlayer2((room['player'])[1]);
  });
}




 }
