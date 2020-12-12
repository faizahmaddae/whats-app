import 'package:flutter/material.dart';

class CallsPage extends StatefulWidget {
  @override
  _CallsPageState createState() => _CallsPageState();
}
class _CallsPageState extends State<CallsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new ListView.builder(
        padding: EdgeInsets.only(top: 10),
        itemCount: 20,
        itemBuilder: (BuildContext context, int index) {
          return itmes(index);
        },
      ),
    );
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
        trailing: new Icon(Icons.call, color:Theme.of(context).primaryColor),
      ),
    );
  }
}
