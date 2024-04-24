import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'package:tik_tac_toe_online/provider/room_data_provider.dart';
import 'package:tik_tac_toe_online/utils/show_dia_log.dart';

class CheckWin{

  void checkWin(BuildContext context, Socket socket){

    String winner = '';

    RoomDataProvider roomDataProvider = Provider.of<RoomDataProvider>(context, listen: false);

    if(roomDataProvider.gameProceess[0]==roomDataProvider.gameProceess[1] && roomDataProvider.gameProceess[0]==roomDataProvider.gameProceess[2] && roomDataProvider.gameProceess[0] != '' ){
      winner = roomDataProvider.gameProceess[0];
    }

    if(roomDataProvider.gameProceess[3]==roomDataProvider.gameProceess[4] && roomDataProvider.gameProceess[3]==roomDataProvider.gameProceess[5] && roomDataProvider.gameProceess[3] != '' ){
      winner = roomDataProvider.gameProceess[3];
    }

    if(roomDataProvider.gameProceess[6]==roomDataProvider.gameProceess[7] && roomDataProvider.gameProceess[6]==roomDataProvider.gameProceess[8] && roomDataProvider.gameProceess[6] != '' ){
      winner = roomDataProvider.gameProceess[6];
    }

    if(roomDataProvider.gameProceess[0]==roomDataProvider.gameProceess[3] && roomDataProvider.gameProceess[0]==roomDataProvider.gameProceess[6] && roomDataProvider.gameProceess[0] != '' ){
      winner = roomDataProvider.gameProceess[0];
    }

    if(roomDataProvider.gameProceess[1]==roomDataProvider.gameProceess[4] && roomDataProvider.gameProceess[1]==roomDataProvider.gameProceess[7] && roomDataProvider.gameProceess[1] != '' ){
      winner = roomDataProvider.gameProceess[1];
    }

    if(roomDataProvider.gameProceess[2]==roomDataProvider.gameProceess[5] && roomDataProvider.gameProceess[2]==roomDataProvider.gameProceess[8] && roomDataProvider.gameProceess[2] != '' ){
      winner = roomDataProvider.gameProceess[2];
    }

    if(roomDataProvider.gameProceess[0]==roomDataProvider.gameProceess[4] && roomDataProvider.gameProceess[0]==roomDataProvider.gameProceess[8] && roomDataProvider.gameProceess[0] != '' ){
      winner = roomDataProvider.gameProceess[0];
    }

    if(roomDataProvider.gameProceess[2]==roomDataProvider.gameProceess[4] && roomDataProvider.gameProceess[2]==roomDataProvider.gameProceess[6] && roomDataProvider.gameProceess[2] != '' ){
      winner = roomDataProvider.gameProceess[2];
    }


    if(winner != ''){
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(winner + ' is winer'),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            actions: [
              TextButton(onPressed: ()
              {
                 
                Navigator.pop(context); 
                }, child: Text('Again'))
            ],
          );
        },
      );
    }else if(roomDataProvider.choosePlay == 9){
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Draw'),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            actions: [
              TextButton(onPressed: (){ Navigator.pop(context); }, child: Text('Again'))
            ],
          );
        },
      );
    }

  }

}