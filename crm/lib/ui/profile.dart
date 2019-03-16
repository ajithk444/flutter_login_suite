import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _backgroundColor = Colors.white;
  final _profileUrl ='https://devboxrgdiag692.blob.core.windows.net/images/ajith_1.jpg';
     // 'https://pbs.twimg.com/profile_images/947228834121658368/z3AHPKHY_400x400.jpg';

  bool isFavourite = false;
  _togglFavourites() {
    setState(() {
      isFavourite = !isFavourite;
    });
  }

  get _lauchWebsite => OutlineButton(
        color: Colors.red,
        onPressed: () {
          _launchURL();
        },
        child: Text('View',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14.0,
            )),
      );

  get _userName => Text(
        'Ajith Kumar R S',
        style: TextStyle(
            color: Colors.grey, fontSize: 24.0, fontWeight: FontWeight.bold),
      );

  get _userRole => Text(
        'Senior Software Engineer',
        style: TextStyle(
            color: Colors.grey[400],
            fontSize: 16.0,
            fontWeight: FontWeight.w500),
      );

  get _userDescription => Text(
        'DotNet, Vue and Flutter Developer',
        style: TextStyle(
            color: Colors.grey[400],
            fontSize: 20.0,
            fontWeight: FontWeight.w500),
      );

  get _userAvatar => Hero(
        tag: 'Ajith',
        child: CircleAvatar(
          maxRadius: 80.0,
          backgroundImage: NetworkImage(_profileUrl),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      appBar: AppBar(
        title: Text('Profile'),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(isFavourite ? Icons.favorite : Icons.favorite_border),
            onPressed: () {
              _togglFavourites();
            },
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          )
        ],
      ),
      body: Container(
        width: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            _userAvatar,
            SizedBox(height: 10.0),
            _userName,
            SizedBox(height: 5.0),
            _userRole,
            _userDescription,
            SizedBox(height: 5.0),
            _lauchWebsite,
          ],
        ),
      ),
    );
  }
}

_launchURL() async {
  const url = 'https://ajith.page';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
