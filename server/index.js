const express = require('express');
const http = require('http')
const mongoose = require("mongoose");
const roomModel = require('./models/room');


//config dot env
require('dotenv').config()


const app = express();
const port = process.env.PORT || 3000;
const server = http.createServer(app);





//client -> middleware -> server
///middle ware 
app.use(express.json());




//Turn on socket.io
var io = require('socket.io')(server)

io.on("connection", (socket) => {
        console.log("connected socket.io success"); 
        //CreateRoom
        socket.on("createRoom", async ({nickname}) => { 
            try {
                
            //room is created
            let room = new roomModel()
            let player = {
                socketID : socket.id,
                nickname,
                playerType: 'X',
            }
            room.player.push(player),
            room.turn = player,
            await room.save()

            //Get room_id after create Room
            const roomId = room._id.toString()

            socket.join(roomId);

            
            io.to(roomId).emit('createdRoomSuccess', room);

            } catch (error) {
                console.log(e);
            }
        })
  });


//connect mongoose
mongoose.connect(process.env.DBURI).then(() => {
    console.log("Connect DB successful");
}).catch((error) => {
    console.log("Connect DB fail"); 
})


//Turn on Server
server.listen(port, () => {
    console.log(`Server running on ${port}`);
})




