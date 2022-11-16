import 'package:flutter/material.dart';
import 'package:fruitpuzzle/first.dart';

void main() {
  runApp(MaterialApp(
    home: fruite(),
  ));
}

class fruite extends StatefulWidget {
  const fruite({Key? key}) : super(key: key);

  @override
  State<fruite> createState() => _fruiteState();
}

class _fruiteState extends State<fruite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Select mode"),
      actions: [
        IconButton(onPressed: () {

        }, icon: Icon(Icons.volume_up)),
        PopupMenuButton(itemBuilder: (context) => [
          PopupMenuItem(child: Text("SHARE")),
          PopupMenuItem(child: Text("MORE GAMES")),
          PopupMenuItem(child: Text("PRIVACY POLICY")),
        ],)
      ],
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            child: ElevatedButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return first();
              },));
            }, child: Text("start"))
          )
        ],
      ),
    );
  }
}

