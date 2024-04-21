import 'package:flutter/material.dart';
import 'package:tik_tac_toe_online/responesive/responsive.dart';
import 'package:tik_tac_toe_online/screens/create_room_screen.dart';
import 'package:tik_tac_toe_online/screens/join_room_screen.dart';
import 'package:tik_tac_toe_online/widgets/cutom_button.dart';

class MainMenuScreen extends StatelessWidget {

  static String route = '/main-menu';

  MainMenuScreen({super.key});

  void createRoom(BuildContext context){
    Navigator.pushNamed(context, CreateRoomScreen.routeName);
  }

  void joinRoom(BuildContext context){
    Navigator.pushNamed(context, JoinRoomScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      body: ResponesiveScreen(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
            
              mainAxisAlignment: MainAxisAlignment.center,
            
              children: [
                //Create Room
                CustomButton(
                  text: "Create Room",
                  onTap: (){
                    createRoom(context);
                  },
                ),
            
                const SizedBox(
                  height: 20,
                ),
            
                //Join Room
                CustomButton(
                  text: "Join Room",
                  onTap: () {
                    joinRoom(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
