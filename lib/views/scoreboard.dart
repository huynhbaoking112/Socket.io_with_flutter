// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tik_tac_toe_online/provider/room_data_provider.dart';

class Scoreboard extends StatelessWidget {
  const Scoreboard({super.key});

  @override
  Widget build(BuildContext context) {
    RoomDataProvider roomDataProvider = Provider.of<RoomDataProvider>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                roomDataProvider.player1.nickname,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(roomDataProvider.player1.points.toString(),
                  style: TextStyle(fontSize: 20, color: Colors.white))
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(roomDataProvider.player2.nickname,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Text(roomDataProvider.player2.points.toString(),
                  style: TextStyle(fontSize: 20, color: Colors.white))
            ],
          ),
        )
      ],
    );
  }
}
