import 'package:flutter/material.dart';
import 'package:work_shop_1/models/email.dart';
import 'package:work_shop_1/screens/detail/deail_page.dart';
import 'package:work_shop_1/screens/inbox/widgets/email_card.dart';

class InboxPage extends StatefulWidget {
  InboxPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _InboxPageState createState() => _InboxPageState();
}

class _InboxPageState extends State<InboxPage> {
  List<Email> emails = List<Email>();

  void _composeEmail() {}

  void _viewEmailDetail(index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailPage(email: emails[index]),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    emails.add(Email(
        sender: "Mark Zuckerberg",
        image:
        "https://www.biography.com/.image/t_share/MTQyMDA0NDgwMzUzNzcyNjA2/mark-zuckerberg_gettyimages-512304736.jpg",
        title: "CNN Business interview",
        content:
        "After spending much of this year apologizing for Facebook's many missteps, CEO Mark Zuckerberg was defiant in an exclusive interview with CNN Business on Tuesday."));

    emails.add(Email(
        sender: "Bill Gates",
        image:
        "https://pbs.twimg.com/profile_images/988775660163252226/XpgonN0X_400x400.jpg",
        title: "Birthday gift",
        content: "I want iPad Pro!"));

    emails.add(Email(
        sender: "Steve Jobs",
        image:
        "https://specials-images.forbesimg.com/imageserve/5b8576db31358e0429c734e3/416x416.jpg?background=000000&cropX1=211&cropX2=2381&cropY1=900&cropY2=3072",
        title: "2018 iPad Pro redesign is both brilliant and stupid",
        content:
        "Apple appears poised to unveil the most significant redesign of the iPad in years. Renders of 2018’s iteration of the 12.9-inch iPad Pro have leaked out, showing that this model will include changes that will make it the best tablet Apple ever released."));

    emails.add(Email(
        sender: "Tony Stark",
        image:
        "https://cdn.comicsverse.com/wp-content/uploads/2017/11/facebook-Linked_Image___tony-stark-header.jpg",
        title: "Avengers 4",
        content:
        "The Independent's complete collection of articles and commentary on Tony Stark."));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("assets/images/google.png"),
                backgroundColor: Colors.white,
              ),
              accountName: Text("Mr. Flutter Thai"),
              accountEmail: Text("contect@flutter.io"),
            ),
            Column(
              children: <Widget>[
                ListTile(
                  leading: Icon(
                    Icons.inbox,
                    color: Colors.redAccent,
                  ),
                  title: Text("Inbox"),
                ),
                ListTile(
                  leading: Icon(Icons.send),
                  title: Text("Outbox"),
                ),
                ListTile(
                  leading: Icon(Icons.delete),
                  title: Text("Trash"),
                )
              ],
            )
          ],
        ),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: emails.length,
            itemBuilder: (buildContext, position) {
              return GestureDetector(
                onTap: ()=> _viewEmailDetail(position),
                child: EmailCard(emails[position]),
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _composeEmail,
        tooltip: 'Compose Email',
        child: Icon(Icons.add),
      ),
    );
  }
}