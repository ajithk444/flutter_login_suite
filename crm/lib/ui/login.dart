import 'package:flutter/material.dart';
import './register.dart';
import './resetpassword.dart';
import './dashboard.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  get logo => Container(
        alignment: Alignment(0, 0),
        child: Column(
          children: <Widget>[
            Hero(
              tag: 'hero',
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 100.0,
                child: Image.asset('assets/logo.png'),
              ),
            )
          ],
        ),
      );

  get _userNamefield => TextFormField(
        validator: (value) {
          if (value.isEmpty) {
            return 'Please enter a valid e-mail';
          }
        },
        decoration: InputDecoration(
            labelText: 'EMAIL',
            labelStyle:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red))),
      );

  get _passwordField => TextFormField(
        validator: (value) {
          if (value.isEmpty) {
            return 'Please enter the password';
          } else if (value.length <= 6) {
            return 'Please enter a valid password';
          }
        },
        decoration: InputDecoration(
            labelText: 'PASSWORD',
            labelStyle:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red))),
        obscureText: true,
      );

  get _forgotPassword => Container(
        alignment: Alignment(1.0, 0.0),
        padding: EdgeInsets.only(top: 15.0, left: 20.0),
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                new MaterialPageRoute(
                  builder: (BuildContext context) =>
                      new ResetPasswordPage(title: 'Reset Password'),
                ));
          },
          child: Text(
            'Forgot Password?',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blue,
                decoration: TextDecoration.underline),
          ),
        ),
      );

  get _loginButton => Container(
        height: 40.0,
        child: Material(
          borderRadius: BorderRadius.circular(20.0),
          shadowColor: Colors.red,
          color: Colors.black,
          elevation: 1.0,
          child: RaisedButton(
              color: Colors.blue,
              onPressed: () {
                _isLoading = true;
                var isValid = _formKey.currentState.validate();
                if (!isValid) {
                  _isLoading = false;
                }
                if (isValid) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DashboardPage()));
                  _isLoading = false;
                }
              },
              child: Center(
                  child: Text(
                'LOGIN',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ))),
        ),
      );


 Widget get _loadingView {
   if(_isLoading)
    return new Center(
      child: new CircularProgressIndicator(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        resizeToAvoidBottomPadding: true,
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            logo,
            Container(
              padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
              child: Column(
                children: <Widget>[
                  _userNamefield,
                  SizedBox(height: 20.0),
                  _passwordField,
                  SizedBox(height: 20.0),
                  _forgotPassword,
                  SizedBox(height: 40.0),
                  _loginButton,
                  //_loadingView
                ],
              ),
            ),
            SizedBox(height: 15.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'New to CRM ?',
                  style: TextStyle(),
                ),
                SizedBox(
                  width: 5.0,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                          builder: (BuildContext context) =>
                              new RegisterPage(title: 'Register'),
                        ));
                    //Navigator.of(context).pushNamed('/register');
                  },
                  child: Text('Register',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
