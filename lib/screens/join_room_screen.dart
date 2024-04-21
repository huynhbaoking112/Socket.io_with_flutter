import 'package:flutter/material.dart';
import 'package:tik_tac_toe_online/responesive/responsive.dart';
import 'package:tik_tac_toe_online/widgets/custom_text.dart';
import 'package:tik_tac_toe_online/widgets/custom_textfield.dart';
import 'package:tik_tac_toe_online/widgets/cutom_button.dart';

class JoinRoomScreen extends StatefulWidget {
  static String routeName = '/join-room';
  const JoinRoomScreen({super.key});

  @override
  State<JoinRoomScreen> createState() => _JoinRoomScreenState();
}

class _JoinRoomScreenState extends State<JoinRoomScreen> {

  //Name controller
  final TextEditingController controller = TextEditingController();


  // GameId controller
    final TextEditingController gameController = TextEditingController();


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
    gameController.dispose();
  }


   @override
  Widget build(BuildContext context) {

    final Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: ResponesiveScreen(
          child: SingleChildScrollView(
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                // ignore: prefer_const_constructors
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
            
            
                      //Chữ sáng
                     const CustomText(text: 'Join Room', shadows: [
                      Shadow(
                        blurRadius: 40,
                        color: Colors.blue
                      )
                     ], fontsize: 70),
                      
                    SizedBox(height: size.height * 0.08,),
            
            
                      //Điền tên user name
                    CustomTextField(controller: controller ,hintText: "Enter your name",),
             
                      SizedBox(height: size.height * 0.04,),
            
                    // Điền game id
                    CustomTextField(controller: gameController ,hintText: "Enter Game ID",),
             
                      SizedBox(height: size.height * 0.08,),
            
            
                    //Button Create
                    CustomButton(onTap: (){}, text: 'Join'),
            
                  
                  ],
                ),
               
            ),
          ),
        ),
      ),
    );
  }
}