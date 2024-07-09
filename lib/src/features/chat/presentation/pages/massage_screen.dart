import 'package:flutter/material.dart';

class MassageScreen extends StatefulWidget {
  const MassageScreen({super.key});

  @override
  State<MassageScreen> createState() => _MassageScreenState();
}

class _MassageScreenState extends State<MassageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                for(int i=0;i<10;i++)
                  Text("data"),
              ],
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              border: InputBorder.none,
              filled: true,
              fillColor: Colors.white,
              hintText: "Massage",
              suffix: IconButton(onPressed: (){},icon: Icon(Icons.send),)
            ),
          ),
          SizedBox(height: 10,)
        ],
      ),
    );
  }
}
