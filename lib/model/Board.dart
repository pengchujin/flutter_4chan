import 'dart:convert' show json;

class Board {
  String board;
  String title;
  int wsBoard;
  int pages;
  int perPage;
  double maxFilesize;
  double maxWebmFilesize;
  double maxCommentChars;
  double maxWebmDuration;
  double bumpLimit;
  double imageLimit;
  String metaDescription;
  int isArchlived;

  Board.fromJson(jsonRes) {
    board = jsonRes['board'];
    title = jsonRes['title'];
    wsBoard = jsonRes['ws_board'];
    perPage = jsonRes['per_page'];
    pages = jsonRes['pages'];
    maxFilesize = jsonRes['max_filesize'];
    maxWebmFilesize = jsonRes['max_webm_filesize'];
    maxCommentChars = jsonRes['max_comment_chars'];
    maxWebmDuration = jsonRes['max_webm_duration'];
    bumpLimit = jsonRes['bump_limit'];
    metaDescription = jsonRes['meta_description'];
    isArchlived = jsonRes['is_archived'];
  }

}