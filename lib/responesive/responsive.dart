// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ResponesiveScreen extends StatelessWidget {
  final Widget child;
  const ResponesiveScreen({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(child: child, constraints: BoxConstraints(maxWidth: 600),),
    );
  }
}
