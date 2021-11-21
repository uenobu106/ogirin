import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('使い方'),
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.amber),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text('カードをスワイプして大喜利のお題を見ていきましょう！',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),

          ),
          Container(
            padding: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.amber),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text('すべてのカードを見終わったらアプリを閉じてもう一度立ち上げてください',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),

          ),
        ],
      ),
    );
  }
}
