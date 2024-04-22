import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tik_tac_toe_online/provider/room_data_provider.dart';
import 'package:tik_tac_toe_online/resources/socket_methods.dart';
import 'package:tik_tac_toe_online/views/scoreboard.dart';
import 'package:tik_tac_toe_online/views/tiktactoe_board.dart';
import 'package:tik_tac_toe_online/views/waiting_lobby.dart';

class GameScreen extends StatefulWidget {
  static String routeName = '/game';
  const GameScreen({super.key});
  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  SocketMethods _socketClient = SocketMethods();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _socketClient.updateRoomListener(context);
    _socketClient.updatePlayersListener(context);
  }

  @override
  Widget build(BuildContext context) {
    RoomDataProvider roomDataProvider = Provider.of<RoomDataProvider>(context);

    return Scaffold(
      body: roomDataProvider.roomData['isJoin']
          ? WaitingLobby()
          : SafeArea(child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Scoreboard(),
              TicTacToeBoard()
            ],
          )),
    );
  }
}
