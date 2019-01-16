import 'dart:async';
import 'dart:convert';

import 'package:four_chan/model/Board.dart';
import 'package:four_chan/api/Constants.dart' as httpConstants;
import 'package:http/http.dart' as http;

class NetworkAPi  {
  static Future _read(String url) {
    return http.read(url);
  }

  static dynamic _get(String url)  async {
    String response = await _read(url);
    // print('$url => \n $response');
    return json.decode(response.replaceAll('\r\n', '').replaceAll('\n', ''));
  }

  static  Future<Boards> getBroadsInfo() async {
    var rawData = await _get(httpConstants.API_BOARDS);
    return Boards.fromJson(rawData['boards']);
  }
}

// void main(List<String> args) {
//   var data = NetworkAPi.getBroadsInfo();
//   print(data.toString());
// }
