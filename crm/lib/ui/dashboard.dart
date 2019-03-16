import 'package:flutter/material.dart';
import './profile.dart';

class DashboardPage extends StatefulWidget {
  final String title = 'Demo';

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  String _value = 'Project 1';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new DropdownButton<String>(
          value: _value,
          items: <DropdownMenuItem<String>>[
            new DropdownMenuItem(
              child: new Text('Project 1'),
              value: 'Project 1',
            ),
            new DropdownMenuItem(
                child: new Text('Project 2'), value: 'Project 2'),
          ],
          onChanged: (String value) {
            setState(() => _value = value);
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                    builder: (BuildContext context) => new ProfilePage(),
                  ));
            },
          ),
        ],
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            ListTile(
                leading: const Icon(Icons.view_list),
                title: const Text('Portal'),
                subtitle: Text('The project portal'),
                onTap: () {}),
            ListTile(
                leading: const Icon(Icons.show_chart),
                title: const Text('Gallery'),
                subtitle: Text('Displays the images in the project'),
                onTap: () {/* react to the tile being tapped */}),
            ListTile(
                leading: const Icon(Icons.graphic_eq),
                title: const Text('Reports'),
                subtitle: Text('AI based project reports'),
                onTap: () {}),
            ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Project Setup'),
                subtitle: Text('Create or View Projects'),
                onTap: () {}),
          ],
        ),
      ),
    );
  }
}
