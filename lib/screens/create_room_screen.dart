// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:tik_tac_toe_online/responesive/responsive.dart';
import 'package:tik_tac_toe_online/widgets/custom_text.dart';
import 'package:tik_tac_toe_online/widgets/custom_textfield.dart';
import 'package:tik_tac_toe_online/widgets/cutom_button.dart';

class CreateRoomScreen extends StatefulWidget {
  static String routeName = '/create-room';

  const CreateRoomScreen({super.key});

  @override
  State<CreateRoomScreen> createState() => _CreateRoomScreenState();
}

class _CreateRoomScreenState extends State<CreateRoomScreen> {
  final TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: ResponesiveScreen(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            // ignore: prefer_const_constructors
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //Chữ sáng
                const CustomText(
                    text: 'Create Room',
                    shadows: [Shadow(blurRadius: 40, color: Colors.blue)],
                    fontsize: 70),

                SizedBox(
                  height: size.height * 0.08,
                ),

                //Điền tên user name
                CustomTextField(
                  controller: controller,
                  hintText: "Enter your name",
                ),

                SizedBox(
                  height: size.height * 0.08,
                ),

                //Button Create
                CustomButton(onTap: () {}, text: 'Create'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
