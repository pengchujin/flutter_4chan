import 'package:flutter/material.dart';
import 'package:four_chan/placeholder.dart';
import 'package:four_chan/ui/board/board.dart';
import 'package:four_chan/ui/hot/pop.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    TopicHomePageView('r9k'),
    BroadHomePageView(),
    PlaceholderWidget(Colors.greenAccent),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          new BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Pop")
          ),
           new BottomNavigationBarItem(
            icon: Icon(Icons.scatter_plot),
            title: Text("Boards")
          ),
           new BottomNavigationBarItem(
            icon: Icon(Icons.adjust),
            title: Text("Me")
          ),
        ],
      ),
      );
  }
  void onTabTapped(int index) {
    setState(() {
          _currentIndex = index;
        });
  }
}

