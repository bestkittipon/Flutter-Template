import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:work_shop_1/models/email.dart';

class EmailContent extends StatelessWidget {
  EmailContent(this.email);

  final Email email;


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        CircleAvatar(
          backgroundImage: NetworkImage(email.image),
        ),
        Text(email.sender),
        Text(email.title),
        Row (
          children: <Widget>[
            Expanded(
              child: Text(
                email.content,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ],
    );
  }

}