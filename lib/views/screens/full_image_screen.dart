import 'package:flutter/material.dart';

class FullImageScreen extends StatelessWidget {
  final String fullimage;
  const FullImageScreen({super.key,required this.fullimage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height*.9,
        width: MediaQuery.of(context).size.height*.9,
        decoration: BoxDecoration(
        image: DecorationImage(fit: BoxFit.fill,
          image: NetworkImage(fullimage))),),
    );
  }
}