const express = require('express');
const http = require('http')
const mongoose = require("mongoose");
require('dotenv').config()


const app = express();
const port = process.env.PORT || 3000;
var server = http.createServer(app);



//client -> middleware -> server
///middle ware 
app.use(express.json());




//Turn on socket.io
var io = require('socket.io')(server)

io.on("connection", (socket) => {
        console.log("connected socket.io success");
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




