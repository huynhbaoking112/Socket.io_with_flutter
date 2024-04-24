import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tik_tac_toe_online/provider/room_data_provider.dart';
import 'package:tik_tac_toe_online/resources/socket_methods.dart';

class TicTacToeBoard extends StatefulWidget {
  const TicTacToeBoard({super.key});

  @override
  State<TicTacToeBoard> createState() => _TicTacToeBoardState();
}

class _TicTacToeBoardState extends State<TicTacToeBoard> {
   SocketMethods _socketMethods = SocketMethods();

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _socketMethods.updateBlankListner(context);
  }

  void onTapped(int index, BuildContext context) {
    _socketMethods.handlePlus(index, context);
  }

  @override
  Widget build(BuildContext context) {
    //  RoomDataProvider roomDataProvider =
    //     Provider.of<RoomDataProvider>(context, listen: false);

    final size = MediaQuery.of(context).size;

    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: size.height * 0.7, maxWidth: 500),
      child: GridView.builder(
        itemCount: 9,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              onTapped(index, context);
            },
            child: Container(
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.white24)),
              child: Center(
                child: Text(
                  Provider.of<RoomDataProvider>(context, listen: true).gameProceess[index],
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 100,
                      shadows: [
                        const Shadow(
                          blurRadius: 40,
                          color: Colors.blue,
                        )
                      ]),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
