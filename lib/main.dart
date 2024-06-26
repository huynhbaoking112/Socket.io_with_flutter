import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tik_tac_toe_online/provider/room_data_provider.dart';
import 'package:tik_tac_toe_online/screens/create_room_screen.dart';
import 'package:tik_tac_toe_online/screens/game_screens.dart';
import 'package:tik_tac_toe_online/screens/join_room_screen.dart';
import 'package:tik_tac_toe_online/screens/main_menu_screen.dart';
import 'package:tik_tac_toe_online/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RoomDataProvider(),
      child: MaterialApp(
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: bgColor
        ),
        debugShowCheckedModeBanner: false,
        routes: {
          MainMenuScreen.route : (context) => MainMenuScreen(),
          JoinRoomScreen.routeName :(context) =>  JoinRoomScreen(),
          CreateRoomScreen.routeName :(context) => CreateRoomScreen(),
          GameScreen.routeName: (context) => GameScreen(),
        },
        initialRoute: MainMenuScreen.route,
      ),
    );
  }
}