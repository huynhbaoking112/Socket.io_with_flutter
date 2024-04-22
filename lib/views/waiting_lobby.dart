import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tik_tac_toe_online/provider/room_data_provider.dart';
import 'package:tik_tac_toe_online/responesive/responsive.dart';
import 'package:tik_tac_toe_online/widgets/custom_textfield.dart';

class WaitingLobby extends StatefulWidget {
  const WaitingLobby({super.key});

  @override
  State<WaitingLobby> createState() => _WaitingLobbyState();
}

class _WaitingLobbyState extends State<WaitingLobby> {

  late TextEditingController roomIdController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    roomIdController = TextEditingController(text: Provider.of<RoomDataProvider>(context, listen: false).roomData['_id']);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    roomIdController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ResponesiveScreen(
      child: Padding(

        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Waiting for a player to join..."),
            const SizedBox(height: 20,),
            CustomTextField(controller: roomIdController, hintText: '', isReadOnly: true,)
          ],
        ),
      ),
    );
  }
}