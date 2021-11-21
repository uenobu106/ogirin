import 'package:flutter/material.dart';
import 'package:swipe_cards/swipe_cards.dart';
import 'content.dart';
import 'about.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OGIRIN',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
        title: 'OGIRIN',
        key: null,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<SwipeItem> _swipeItems = [];
  late MatchEngine _matchEngine;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  //ここの　"　"　の中身を作りたいアプリに応じて書き換える
  List<String> _names = [
    "お寿司屋さんを出禁になった外国人。何をした？",
    "人気すぎて予約が必要な公衆電話, 一体なぜ？",
    "ボーリング場に迷惑客が来た時の間違った対処法を教えて下さい",
    "スプーン曲げを極めるとできるようになることとは？"
  ];
  // カードの色、一枚目から順番に指定する
  List<Color> _colors = [
    Colors.yellow.shade100,
    Colors.amber.shade100,
    Colors.red.shade100,
    Colors.blue.shade100
  ];

  @override
  void initState() {
    for (int i = 0; i < _names.length; i++) {
      _swipeItems.add(SwipeItem(
        content: Content(text: _names[i], color: _colors[i]),
      ));
    }

    _matchEngine = MatchEngine(swipeItems: _swipeItems);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        // 上に表示されるタイトル
        title: Text('OGIRIN'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => About(),
                    ));
              },
              icon: Icon(Icons.book))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(children: [
            Container(
              height: 550,
              child: SwipeCards(
                matchEngine: _matchEngine,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    alignment: Alignment.center,
                    color: _swipeItems[index].content.color,
                    child: Text(
                      _swipeItems[index].content.text,
                      style: TextStyle(fontSize: 30),
                    ),
                  );
                },
                onStackFinished: () {
                  _scaffoldKey.currentState!.showSnackBar(SnackBar(
                    content: Text("カードが終了しました"),
                    duration: Duration(milliseconds: 500),
                  ));
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      _matchEngine.currentItem?.nope();
                    },
                    child: Text('覚えてない')),
                ElevatedButton(
                    onPressed: () {
                      _matchEngine.currentItem?.like();
                    },
                    child: Text('覚えてる')),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
