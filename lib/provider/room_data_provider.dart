import 'package:flutter/material.dart';
import 'package:tik_tac_toe_online/models/player.dart';

class RoomDataProvider extends ChangeNotifier {
  Map<String, dynamic> _roomData = {};
  Player _player1 =
      Player(nickname: '', socketID: 'socketID', points: 0, playerType: 'X');

  Player _player2 =
      Player(nickname: '', socketID: 'socketID', points: 0, playerType: 'O');

  List<String> _gameProcess = List.filled(9, "");
  int _choosePlay = 0;



  //Getter

  List<String> get gameProceess => _gameProcess;

  Map<String, dynamic> get roomData => _roomData;
  Player get player1 => _player1;
  Player get player2 => _player2;
  int   get choosePlay => _choosePlay; 


  //Setter
  void updateGameProcess(int index, String symbol){
    _choosePlay ++;
    _gameProcess[index] = symbol;
     notifyListeners();
  }

  void updateRoomData(Map<String, dynamic> data) {
    _roomData = data;
    notifyListeners();
  }

  void updatePlayer1(Map<String, dynamic> player1Data) {
    _player1 = Player.fromMap(player1Data);
    notifyListeners();
  }

  void updatePlayer2(Map<String, dynamic> player2Data) {
    _player2 = Player.fromMap(player2Data);
    notifyListeners();
  }
}
 