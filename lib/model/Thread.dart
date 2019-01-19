
class Thread {
  num no;
  String now;
  String name;
  String sub;
  String com;
  String filename;
  String ext;
  num w;
  num h;
  num tnW;
  num tnH;
  num tim;
  num time;
  String md5;
  num fsize;
  num resto;
  String id;
  String country;
  num bumplimit;
  num imagelimit;
  String semanticUrl;
  String countryName;
  //[todo] m_image what's this;
  num replies;
  num lastModified;
  Replys lastReplies;

  Thread.fromJson(jsonRes) {
    no = jsonRes['no'];
    name = jsonRes['name'];
    sub = jsonRes['sub'];
    com = jsonRes['com'];
    filename = jsonRes['filename'];
    ext = jsonRes['ext'];
    w = jsonRes['w'];
    h = jsonRes['h'];
    tnW = jsonRes['tn_w'];
    tnH = jsonRes['tn_h'];
    tim = jsonRes['tim'];
    time = jsonRes['time'];
    md5 = jsonRes['md5'];
    fsize = jsonRes['fsize'];
    resto = jsonRes['resto'];
    id = jsonRes['id'];
    country = jsonRes['country'];
    bumplimit = jsonRes['bumplimit'];
    imagelimit  = jsonRes['imagelimit'];
    semanticUrl = jsonRes['semantic_url'];
    countryName = jsonRes['country_name'];
    replies = jsonRes['replies'];
    lastModified = jsonRes['lastModified'];
    if(jsonRes.containsKey("last_replies")) {
      lastReplies = Replys.fromJson(jsonRes['last_replies']);
    } else {

    }
  }
}

class Reply {
  num no;
  String now;
  String name;
  String com;
  String filename;
  String ext;
  num w;
  num h;
  num tnW;
  num tnH;
  num tim;
  num time;
  String md5;
  num fsize;
  num resto;
  String id;
  String country;
  String countryName;
  
  Reply.fromJson(jsonRes){
    no = jsonRes['no'];
    now = jsonRes['com'];
    com = jsonRes['com'];
    filename = jsonRes['filename'];
    ext = jsonRes['ext'];
    w = jsonRes['w'];
    h = jsonRes['h'];
    tnW = jsonRes['tn_w'];
    tnH = jsonRes['tn_h'];
    tim = jsonRes['tim'];
    time = jsonRes['time'];
    md5 = jsonRes['md5'];
    fsize = jsonRes['fsize'];
    resto = jsonRes['resto'];
    id = jsonRes['id'];
    country = jsonRes['country'];
    countryName = jsonRes['country_name'];
  }
  
}


class Replys {
  List<Reply> list;
  Replys.fromJson(jsonRes) {
    list = [];
    for (var listItem in jsonRes) {
      list.add(new Reply.fromJson(listItem));
    }
  }
}

class Threads {
  List<Thread> list;
  Threads.fromJson(jsonRes) {
    list = [];
    for (var listItem in jsonRes) {
      list.add(new Thread.fromJson(listItem));
    }
  }
}

