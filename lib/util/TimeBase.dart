class TimeBase {
  int timestamp;

  TimeBase(this.timestamp);

  String getShowTime({int timestamp}) {
    int time;

    if (timestamp == null) {
      time = this.timestamp;
    } else {
      time = timestamp;
    }

    return getStandardDate(time);
  }

  static String getStandardDate(int timestamp) {
    String temp = "";
    try {
      int now = (new DateTime.now().millisecondsSinceEpoch ~/ 1000);
      int diff = now - timestamp;
      int year = (diff ~/ (60 * 60 * 24 * 30 * 12));
      int months = (diff ~/ (60 * 60 * 24 * 30));
      int days = (diff ~/ (60 * 60 * 24));
      int hours = ((diff - days * (60 * 60 * 24)) ~/ (60 * 60));
      int minutes = ((diff - days * (60 * 60 * 24) - hours * (60 * 60)) ~/ 60);
      if(year > 0) {
        temp = year.toString() + "y";
      }
      else if (months > 0) {
        temp = months.toString() + "month";
      } else if (days > 0) {
        temp = days.toString() + "d";
      } else if (hours > 0) {
        temp = hours.toString() + "h";
      } else {
        temp = minutes.toString() + "m";
      }
    } catch (e) {
      e.toString();
    }
    return temp;
  }
}

class HtmlR{
  var style = '';
  static getHtml(String raw) {
    if(raw == null) {
      raw = 'null';
    }
    var test = raw.replaceAll('<br>', '\n').replaceAll('class=\"quote\"', 'style=\"color: #789922;\"');
    if(test.contains('<p')) {
    } else {
      test = '<p style=\"font-size:80%;\">' + test + '</p>';
    }
    var res = test;
    // print(test);
    return res;
  }
}

getFlag(String code) {
      print(code);
      if (code == null) {
        code = 'US';
      }
      int firstLetter = code.codeUnitAt(0) - 0x41 + 0x1F1E6;
      int secondLetter = code.codeUnitAt(1) - 0x41 + 0x1F1E6;
      return String.fromCharCode(firstLetter) + String.fromCharCode(secondLetter);
}

// void main () {
//   print(getFlag('US'));
// }