import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tik_tac_toe_online/provider/room_data_provider.dart';

class GameScreen extends StatefulWidget {
  static String routeName = '/game';
  const GameScreen({super.key});
  

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {

    // print(Provider.of<RoomDataProvider>(context).player1.nickname);
    // print(Provider.of<RoomDataProvider>(context).player2.nickname);

    return Scaffold(
      body: Center(
        child: Text( Provider.of<RoomDataProvider>(context, listen: false).roomData.toString()
),
      ),
    );
  }
}