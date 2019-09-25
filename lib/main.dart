import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: AuthenticationPage(),
    );
  }
}

bool disable = true;
GoogleSignIn googleSignIn;

class AuthenticationPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AuthenticationPageState();
  }
}

class _AuthenticationPageState extends State<AuthenticationPage> {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _googleSignInButton(),
          FlatButton(
            child: Text("Sign out"),
            onPressed: _googleSignOut,
          )
        ]
      ),
    );
  }

  Widget _googleSignInButton() {
    return OutlineButton(
      onPressed: _googleSignIn,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      borderSide: BorderSide(color: Colors.grey),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(image: AssetImage("assets/google_logo.png"), height: 35.0),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Accedi con Google',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _googleSignIn() async {
    googleSignIn = GoogleSignIn(scopes: ['email']);
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    if(googleSignInAccount != null) {
      GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

      print("Nome: " + googleSignInAccount.displayName);
      print("Email: " + googleSignInAccount.email);
      print("idToken: " + googleSignInAuthentication.idToken);
    }
  }

  _googleSignOut() async {
    googleSignIn.signOut();
    print("Sign out");
  }
}

