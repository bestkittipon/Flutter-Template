import 'package:flutter/material.dart';
import 'package:work_shop_1/configs/app_config.dart';
import 'package:work_shop_1/screens/inbox/inbox_page.dart';

class InboxApp extends StatelessWidget{
  InboxApp(this.config);
  final AppConfig config;


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: config.appName,
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: InboxPage(title: 'Inbox'),
    );
  }

}