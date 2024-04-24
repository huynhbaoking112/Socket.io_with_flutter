const express = require("express");
const http = require("http");
const mongoose = require("mongoose");
const roomModel = require("./models/room");
const ObjectId = mongoose.Types.ObjectId;


//config dot env
require("dotenv").config();

const app = express();
const port = process.env.PORT || 3000;
const server = http.createServer(app);

//client -> middleware -> server
///middle ware
app.use(express.json());

//Turn on socket.io
var io = require("socket.io")(server);

io.on("connection", (socket) => {
  console.log("connected socket.io success");

  //CreateRoom
  socket.on("createRoom", async ({ nickname }) => {
    try {
      //room is created
      let room = new roomModel();
      let player = {
        socketID: socket.id,
        nickname,
        playerType: "X",
      };
      room.player.push(player), (room.turn = player), await room.save();

      //Get room_id after create Room
      const roomId = room._id.toString();

      socket.join(roomId);

      io.to(roomId).emit("createdRoomSuccess", room);
    } catch (error) {
      console.log(e);
    }
  });

  //Join room
  socket.on("joinRoom", async ({ nickname, roomId }) => {
    try {
        
        const isValidObjectId = ObjectId.isValid(roomId);
        if(!isValidObjectId){
            return io.to(socket.id).emit("roomNotExists")
        }

        let room = await roomModel.findById(roomId)
        
        // If room is not exists
        if(!room){
            return io.to(socket.id).emit("roomNotExists")
        }

        // If room full
        if(!room.isJoin){
            return io.to(socket.id).emit("roomFull")
        }

        let playerTwo = {
            nickname,
            socketID : socket.id,
            playerType: "O"
        }

        socket.join(roomId)
         
        room.player.push(playerTwo);
        room.isJoin  = false,
        await room.save();

        io.to(roomId).emit("joinRoomSuccess", room)
        io.to(roomId).emit("updatePlayers", room)
        io.to(roomId).emit("updateRoom", room)

    } catch (error) {
      console.log(error);
    }
  });

  //SelectBlank
  socket.on('selectBlank',async ({index, roomID}) => {
   try {
    var room = await roomModel.findById(roomID);
    var currentTurn = room.turn

    var indexs = room.turnIndex
    room.turnIndex = indexs == 0 ? 1 : 0
    room.turn = indexs == 0? room.player[1] : room.player[0] 

    await room.save();

    io.to(roomID).emit('tickBlank', ({'room': room, 'symbol': currentTurn.playerType, index}));

   } catch (error) {
    console.log(error);    
   }



  })


});

//connect mongoose
mongoose
  .connect(process.env.DBURI)
  .then(() => {
    console.log("Connect DB successful");
  })
  .catch((error) => {
    console.log("Connect DB fail");
  });

//Turn on Server
server.listen(port, () => {
  console.log(`Server running on ${port}`);
});
