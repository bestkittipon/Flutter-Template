import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:work_shop_1/models/email.dart';
import 'package:work_shop_1/screens/detail/widgets/email_content.dart';

class DetailPage extends StatefulWidget {
  DetailPage({Key key, this.title, this.email}) : super(key: key);
  final String title;
  final Email email;

  @override
  State<StatefulWidget> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  _DetailPageState();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void showDemoDialog<T>({BuildContext context, Widget child}) {
    showDialog<T>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => child,
    ).then<void>((T value) {
      // The value passed to Navigator.pop() or null.
      if (value != null) {
        _scaffoldKey.currentState.showSnackBar(
          SnackBar(
            content: Text('You selected: $value'),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return CupertinoApp(
          home: CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
                middle: Text(widget.email.title),
              ),
              child: SafeArea(
                child: CupertinoButton(
                  child: Text(widget.email.sender),
                  color: CupertinoColors.activeBlue,
                  onPressed: () {
                    showDemoDialog<String>(
                      context: context,
                      child: CupertinoAlertDialog(
                        title: const Text('Discard draft?'),
                        actions: <Widget>[
                          CupertinoDialogAction(
                            child: const Text('Discard'),
                            isDestructiveAction: true,
                            onPressed: () {
                              Navigator.pop(context, 'Discard');
                            },
                          ),
                          CupertinoDialogAction(
                            child: const Text('Cancel'),
                            isDefaultAction: true,
                            onPressed: () {
                              Navigator.pop(context, 'Cancel');
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              )));
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.email.title),
        ),
        body: EmailContent(widget.email));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
}
