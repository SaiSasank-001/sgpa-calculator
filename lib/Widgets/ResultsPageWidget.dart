import 'package:flutter/material.dart';

class ResultsPage extends StatefulWidget {
  const ResultsPage({
    Key key,
    @required List<dynamic> result,
  })  : _result = result,
        super(key: key);

  final List<dynamic> _result;

  @override
  _ResultsPageState createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  @override
  Widget build(BuildContext context) {
    List _subjects = widget._result.elementAt(2);

    // Colors
    Color gradeColor;
    if (widget._result.elementAt(0).values.elementAt(0) == "FAIL") {
      gradeColor = Colors.red;
    } else {
      gradeColor = Colors.green;
    }
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "SGPA",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("${widget._result.elementAt(0).values.elementAt(0)}",
                style: TextStyle(
                  color: gradeColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                )),
          ),
          Divider(),
          ListTile(
            // Name
            leading: Icon(
              Icons.confirmation_num,
              color: Colors.amber[200],
            ),
            title: Text("${widget._result.elementAt(1).keys.elementAt(0)}",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                )),
            subtitle: Text(
              "${widget._result.elementAt(1).values.elementAt(0)}",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Divider(),
          ListTile(
            // Name
            leading: Icon(
              Icons.vpn_key,
              color: Colors.amber[200],
            ),
            title: Text("${widget._result.elementAt(1).keys.elementAt(3)}",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                )),
            subtitle: Text("${widget._result.elementAt(1).values.elementAt(3)}",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                )),
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.person,
              color: Colors.amber[200],
            ),
            // Name
            title: Text("${widget._result.elementAt(1).keys.elementAt(1)}",
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 14,
                )),
            subtitle: Text("${widget._result.elementAt(1).values.elementAt(1)}",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                )),
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.family_restroom,
              color: Colors.amber[200],
            ),
            // Name
            title: Text("${widget._result.elementAt(1).keys.elementAt(2)}",
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w300,
                )),
            subtitle: Text("${widget._result.elementAt(1).values.elementAt(2)}",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                )),
          ),
          Divider(
            thickness: 1.0,
          ),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: _subjects.length,
            itemBuilder: (BuildContext context, int index) {
              print(index);
              String subjectCode =
                  _subjects.elementAt(index).values.elementAt(0);
              String subjectName =
                  _subjects.elementAt(index).values.elementAt(1);
              String gradeEarned =
                  _subjects.elementAt(index).values.elementAt(2);
              String subjectCredits =
                  _subjects.elementAt(index).values.elementAt(3);

              Color gradeColor;
              if (gradeEarned == "F") {
                gradeColor = Colors.red;
              } else {
                gradeColor = Colors.blue[100];
              }
              return Column(
                children: [
                  ListTile(
                    title: Text("$subjectName"),
                    subtitle: Text("Credits : $subjectCredits",
                        style: TextStyle(
                          color: Colors.green,
                        )),
                    leading: Text("$subjectCode"),
                    trailing: Text("$gradeEarned",
                        style: TextStyle(fontSize: 18, color: gradeColor)),
                  ),
                  Divider(thickness: 1.0),
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
