import 'package:flutter/material.dart';
import 'package:four_chan/model/Board.dart';
import 'package:four_chan/api/NetworkApi.dart';
import 'package:four_chan/ui/widget/boardItem.dart';

class BroadHomePageView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new BroadHomePageViewState();
}

class BroadHomePageViewState<View extends StatefulWidget> extends State<View>
  with AutomaticKeepAliveClientMixin {
     Future<Boards> data;
    @override
    bool get wantKeepAlive => true;

    Future<Boards> onRefresh(){
      return NetworkAPi.getBroadsInfo();
    }
    
    Future<Null> _onRefresh(){
    return new Future((){
      setState(() {
        data = onRefresh();
      });
    });
    }

    @override
    void initState() {
      super.initState();
      data = onRefresh();
    }

    Widget build(BuildContext context) {
      return new FutureBuilder<Boards>(
        future: data,
        builder: (context, result) {
          if(result.hasData) {
            return Scaffold(
              appBar: AppBar(
                title: Text('Boards'),
              ),
              body:  new RefreshIndicator(
              child: new ListView(
                children: result.data.list.map((Board board){
                  return new BoardItemView(board);
                }).toList(),
              ),
              onRefresh: _onRefresh,
            ),
            );
          } else if (result.hasError) {
          return new Center(
            child: new Text("${result.error}"),
          );
        }
        return new Center(
          child: new CircularProgressIndicator(),
        );
        },
      );
    }

  }