import 'package:flutter/material.dart';
import 'package:four_chan/model/Thread.dart';
import 'package:four_chan/api/NetworkApi.dart';
import 'package:four_chan/ui/widget/topic.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class TopicHomePageView extends StatefulWidget {
   final String thread;
  TopicHomePageView(this.thread);
  State<StatefulWidget> createState() => new TopicHomePageViewState(thread);
}
class TopicHomePageViewState<View extends StatefulWidget> extends State<View>
  with AutomaticKeepAliveClientMixin {
    final String site;
    TopicHomePageViewState(this.site);

    Future<Threads> data;
    @override
    bool get wantKeepAlive => true;

    Future<Threads> onRefresh(){
      return NetworkAPi.getThreads(site);
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
      return new Scaffold(
        appBar: AppBar(
          title: Text("Pop"),

        ),
        body: new FutureBuilder<Threads>(
        future: data,
        builder: (context, result) {
          if(result.hasData) {
            return new LiquidPullToRefresh(
              child: new ListView(
                children: result.data.list.map((Thread thread){
                  return new TopicItem(thread, site);
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