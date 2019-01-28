import 'package:flutter/material.dart';
import 'package:four_chan/model/Thread.dart';
import 'package:four_chan/ui/widget/comment.dart';
import 'package:four_chan/api/NetworkApi.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
class DetailPageView extends StatefulWidget {
  final Thread thread;
  DetailPageView(this.thread);
   _DetailPageView createState() => new _DetailPageView(thread);
}
class _DetailPageView<View extends StatefulWidget> extends State<View>
  with AutomaticKeepAliveClientMixin {
  final Thread thread;
  _DetailPageView(this.thread);

  Future<Threads> data;
    @override
    
    bool get wantKeepAlive => true;

    Future<Threads> onRefresh(){
      return NetworkAPi.getRelys(thread.no.toString(), thread.board);
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
  // Replys({Key key, this.thread.}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('fchan'),
      ),
       body: new FutureBuilder<Threads>(
        future: data,
        builder: (context, result) {
          if(result.hasData) {
            return new LiquidPullToRefresh(
              child: new ListView(
                children: result.data.list.map((Thread thread){
                  return new Comment(thread, thread.board);
                }).toList(),
              ),
              onRefresh: _onRefresh,
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
      ),
    );
  }
}

