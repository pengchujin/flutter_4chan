import 'package:flutter/material.dart';
import 'package:four_chan/model/Thread.dart';
import 'package:four_chan/util/TimeBase.dart';
import 'package:flutter_html_view/flutter_html_view.dart';

class TopicItem extends StatelessWidget {
  final Thread topic;
  
  final String thread;
  TopicItem(this.topic, this.thread);
  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () {},
      child: Column(
  
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: new Container(
                        width: 40.0,
                        height: 40.0,
                        decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: new NetworkImage('https://api.adorable.io/avatars/100/' +
                                topic.no.toString()),
                          ),
                        ),
                      )),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  child: RichText(
                                    text: TextSpan(children: [
                                      TextSpan(
                                          text: topic.name,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 18.0,
                                              color: Colors.black)),
                                      TextSpan(
                                          text: "   No." + topic.no.toString(),
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              color: Colors.grey)),
                                      TextSpan(
                                          text: "  ·  " +
                                              TimeBase.getStandardDate(
                                                  topic.time),
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              color: Colors.grey))
                                    ]),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                flex: 8,
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(),
                                  child: Icon(Icons.expand_more, color: Colors.green,),
                                ),
                                flex: 1,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: new Container(
                              alignment: Alignment(-1.0, -1.0),
                              child: new HtmlView(
                                  data: HtmlR.getHtml(topic.com),
                                  baseURL: "", // optional, type String
                                  onLaunchFail: (url) {
                                    // optional, type Function
                                    print("launch $url failed");
                                  })),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right:18.0, left: 18.0),
                          child: new Container(
                            child: Pic(topic, thread),
                          ),
                        ),
                        Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(getFlag(topic.country)),
                      Container(
                        child: Row(
                            children: <Widget>[
                              Icon(Icons.comment, color: Colors.grey,),
                              Padding(
                                padding: EdgeInsets.only(left: 8),
                                child: Text(topic.replies.toString(), style: TextStyle(color: Colors.green),),
                              )
                            ],
                        ),
                      ),
                      Container(
                        child: Row(
                            children: <Widget>[
                              Icon(Icons.photo, color: Colors.grey,),
                              Padding(
                                padding: EdgeInsets.only(left: 8),
                                child: Text(topic.images.toString(), style: TextStyle(color: Colors.green),),
                              )
                            ],
                        ),
                      ),
                    ],
                  ),
                )
                      ],
                    ),
                  )
                ],
              )),
              Divider(),
        ],
      ),
    );
  }
}

class Pic extends StatelessWidget {
  final Thread topic;
  final String thread;
  Pic(this.topic, this.thread);
  @override
  Widget build(BuildContext context) {
    if (topic.filename != null) {
      return new GestureDetector(
        onTap: () {},
        child: Image.network(
         'https://i.4cdn.org/' + thread + '/' + topic.tim.toString() + topic.ext,
        fit: BoxFit.cover,
      ),
      );
    } else {
      
    }
  }
}
