import 'package:flutter/material.dart';
import 'package:four_chan/model/Board.dart';
import 'package:four_chan/ui/hot/pop.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BoardItemView extends StatelessWidget {
  final Board board;
  BoardItemView(this.board);
  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => TopicHomePageView(board.board)),
        );
      },
      child: new Card(
        color: Colors.white,
        child: new Container(
          padding: const EdgeInsets.only(top: 0.0, bottom: 0.0),
          child: new Container(
            padding: const EdgeInsets.all(10.0),
            child: new Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new Expanded(
                  flex: 8,
                  child: new Container(
                    alignment: Alignment(-1.0, -1.0),
                    child: new Text(
                      board.board + ' / ' + board.title,
                      style: TextStyle(
                        fontSize: 16.5,
                        color: Colors.green,
                      ),
                    ),
                  ),
                ),
                new Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment(1.0, 1.0),
                    child: Favorite(board: board.title),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Favorite extends StatefulWidget {
  Favorite({Key key, this.board}) : super(key: key);
  final String board;
  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  int f = 0;
  void initState() {
      super.initState();
      _getFavorite();
  }
   _getFavorite() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      f = (prefs.getInt(widget.board) ?? 0);
    });
  }
   _favorite() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      print("test");
      if(prefs.getInt(widget.board) == 1) {
        f = 0;
        prefs.setInt(widget.board, 0);
      } else {
        f = 1;
        prefs.setInt(widget.board, 1);
      }      
    });
  }

  @override
  Widget build(BuildContext context) {
    return new IconButton(
        icon: Icon(f == 1 ? Icons.favorite : Icons.favorite_border,), 
        tooltip: '', 
        color: f == 1 ? Colors.red : null,
        onPressed: _favorite
    );
  }
  // new Icon(
  //       alreadySaved ? Icons.favorite : Icons.favorite_border,
  //       color: alreadySaved ? Colors.red : null,
  //     ),
  //     onTap: () {
  //       setState(() {
  //         if (alreadySaved) {
  //           _saved.remove(pair);
  //         } else {
  //           _saved.add(pair);
  //         }
  //       });
  //     },
}
