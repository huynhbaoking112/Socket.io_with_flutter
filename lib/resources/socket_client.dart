import 'package:socket_io_client/socket_io_client.dart' as IO ;



// Ứng dụng design Pattern (Singleton Pattern)
class SocketClient {
  IO.Socket? socket;
  static SocketClient? _instance;

  SocketClient._internal(){
    socket = IO.io('http://localhost:3000');
    socket!.connect();  
  }

  static SocketClient get instance {
    if(_instance == null){
      _instance = SocketClient._internal();
    }
    return _instance!;
  }

}

