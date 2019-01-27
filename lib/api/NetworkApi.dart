import 'dart:async';
import 'dart:convert';

import 'package:four_chan/model/Board.dart';
import 'package:four_chan/api/Constants.dart' as httpConstants;
import 'package:flutter/services.dart' show rootBundle;
import 'package:http/http.dart' as http;
import 'package:four_chan/model/Thread.dart';

import 'package:shared_preferences/shared_preferences.dart';


_favorite(board) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(board);
  }


class NetworkAPi  {
  static Future _read(String url) {
    return http.read(url);
  }

  static dynamic _get(String url)  async {
    
    String response = await _read(url);
    // print('$url => \n $response');
    return json.decode(response.replaceAll('\r\n', '').replaceAll('\n', ''));
  }

  static Future<Boards> getBroadsInfo() async {
    // var rawData = await _get(httpConstants.API_BOARDS);
    String data = await rootBundle.loadString('assets/board.json');
    var rawData = jsonDecode(data);
    // print(rawData.toString());
    var t = rawData['boards'];
    var res = [];
    for (var item in t) {
      var f = await _favorite(item['title']); 
     if( f == 1) {
       res.insert(0,item);
     } else {
       res.add(item);
     }
    }
    return Boards.fromJson(res);
  }

  static Future<Threads> getThreads(String board) async {
    
    
    // var threads = rawDatas.map((rawData) => rawData['threads'].map((data) => data).toList());
    // var response = threads.map((thread) => thread).toList();
    // print(threads);
    // print(json.decode(rawData[page])['threads']);
    
    if(board == 'pop') {
      var threads = [];
    // print(rawData.toString());
       var t = ['pol', 'r9k', 'jp', 'v'];
       for (var item in t) {
        var rawDatas =  await _get(httpConstants.HOST + item + '/catalog.json');
        rawDatas.forEach((data) => data['threads'].forEach(
          (thread) {
            if(thread['replies'] > 50) {
              thread['board'] = item;
              threads.add(thread);
            }
          }
          //  => thread['replies'] > 50 ?  threads.add(thread)   : thread['1'] 
          ));
      }
  
      return Threads.fromJson(threads);
    } else{
      var rawDatas =  await _get(httpConstants.HOST + board + '/catalog.json');
      var threads = [];
      rawDatas.forEach((data) => data['threads'].forEach((thread) { 
        thread['board'] = board;
        threads.add(thread);
      }));
      return Threads.fromJson(threads);
    }
  }
  
}
  
// void main(List<String> args) async {
//   var data = await NetworkAPi.getThreads('pol', 1);
//   print(data.toString());
// }
