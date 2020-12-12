import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Chatspage extends StatefulWidget {
  @override
  _ChatspageState createState() => _ChatspageState();
}
class _ChatspageState extends State<Chatspage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new ListView.separated(
        padding: EdgeInsets.only(top: 10),
        itemCount: 50,
        itemBuilder: (context, index) {
          return new InkWell(
            onTap: () {},
            splashColor: Theme.of(context).primaryColor,
            child: new ListTile(
              title: new Row(
                children: <Widget>[
                  new Container(
                    margin: EdgeInsets.all(5),
                    height: 60,
                    width: 60,
                    decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.withOpacity(0.5),
                    ),
                  ),
                  new Column(
                    children: <Widget>[
                      new Container(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: new Text(
                          '+93793523024',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      new Text('salam khobe ? '),
                    ],
                  )
                ],
              ),
              trailing: new Text('12/1/19'),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return new Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              new Container(
                margin: EdgeInsets.only(right: 10),
                width: MediaQuery.of(context).size.width * .75,
                child: new Divider(),
              )
            ],
          );
        },
      ),
    );
  }
}