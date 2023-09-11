import 'package:flutter/material.dart';

class NewMessage extends StatefulWidget {
  final String id;
  const NewMessage({super.key, required this.id});

  @override
  State<NewMessage> createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text("New Message "+widget.id),centerTitle: true,automaticallyImplyLeading: true,),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/image_bg.jpg"),
            fit: BoxFit.cover,
            alignment: Alignment.center,
          ),
        ),
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }
}
