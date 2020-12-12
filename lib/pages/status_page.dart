import 'package:flutter/material.dart';

class StatusPage extends StatefulWidget {
  @override
  _StatusPageState createState() => _StatusPageState();
}
// by faiz ahmad dae
// email: faiz ahmad dae
class _StatusPageState extends State<StatusPage> {
  Widget get myStorie => new Container(
        margin: EdgeInsets.only(bottom: 10),
        child: new Row(
          children: <Widget>[
            new Stack(
              children: <Widget>[
                new Container(
                  height: 60,
                  width: 60,
                  decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey,
                  ),
                ),
                new Positioned(
                  right: 0,
                  bottom: 0,
                  child: new Container(
                    decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.green,
                    ),
                    child: new Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
            new Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(
                    'My Status',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  new SizedBox(
                    height: 5,
                  ),
                  new Text('Tap to add status update')
                ],
              ),
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: new ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: 20,
        itemBuilder: (context, index) {
          if (index == 0) {
            return new Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: myStorie,
            );
          } else {
            return new Column(
              children: <Widget>[
                showLable(index),
                itmes(index),
              ],
            );
          }
        },
      ),
    );
  }

  Widget showLable(int index) {
    return (index == 1)
        ? new Container(
            padding: EdgeInsets.all(10),
            color: Colors.grey.withOpacity(0.3),
            width: MediaQuery.of(context).size.width,
            child: new Text('Recent Update'),
          )
        : new Container();
  }

  itmes(int index) {
    return InkWell(
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
                new Text('Today, $index:28 PM'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
