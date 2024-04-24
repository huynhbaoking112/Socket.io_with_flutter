import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tik_tac_toe_online/provider/room_data_provider.dart';
import 'package:tik_tac_toe_online/resources/socket_client.dart';
import 'package:tik_tac_toe_online/screens/game_screens.dart';
import 'package:tik_tac_toe_online/utils/show_dia_log.dart';
import 'package:tik_tac_toe_online/utils/show_snack_bar.dart';
import 'package:tik_tac_toe_online/utils/win_and_full.dart';

class SocketMethods {
  final _socketClient = SocketClient.instance.socket!;

  //Emits
  //Socket on server to create room game
  void createRoom(String nickname) {
    print("kingne");
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

  void handlePlus(int index, BuildContext context) {
    // kiểm tra ô đánh có rỗng hay không

    if (Provider.of<RoomDataProvider>(context, listen: false)
            .gameProceess[index] !=
        "") {
      showDiaLogOnScreen("You cannot select this box", "Ok", context);
    }
    // //Kiểm tra có đến lượt hay không
    else if (Provider.of<RoomDataProvider>(context, listen: false)
            .roomData["turn"]["socketID"] !=
        _socketClient.id) {
      showDiaLogOnScreen("It's not your turn", "Ok", context);
    }

    //Đánh
    else {
      print("king huynh");
      _socketClient.emit("selectBlank", {
        "index": index,
        "roomID": Provider.of<RoomDataProvider>(context, listen: false)
            .roomData['_id']
      });
    }
  }

//Listerner
//receive from server info the room
  void createRoomSuccessListener(BuildContext context) {
    print("king");
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
  void updatePlayersListener(BuildContext context) {
    _socketClient.on('updatePlayers', (room) {
      Provider.of<RoomDataProvider>(context, listen: false)
          .updatePlayer1((room['player'])[0]);
      Provider.of<RoomDataProvider>(context, listen: false)
          .updatePlayer2((room['player'])[1]);
    });
  }

//update room
  void updateRoomListener(BuildContext context) {
    _socketClient.on("updateRoom", (room) {
      Provider.of<RoomDataProvider>(context, listen: false)
          .updateRoomData(room);
    });
  }

// Nhận đánh
  void updateBlankListner(BuildContext context) {
    _socketClient.on('tickBlank', (data) {
      Provider.of<RoomDataProvider>(context, listen: false)
          .updateRoomData(data['room']);
      Provider.of<RoomDataProvider>(context, listen: false)
          .updateGameProcess(data['index'], data['symbol']);

      CheckWin().checkWin(context, _socketClient);
    });

    //Check full và win
  }
}
