import 'package:meta/meta.dart';

class Email {
  Email(
      {@required this.sender,
        @required this.title,
        @required this.content,
        @required this.image});

  String sender;
  String image;
  String title;
  String content;
}