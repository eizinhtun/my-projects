import 'package:flutter/material.dart';

class FacebookProfilePage extends StatefulWidget {
  const FacebookProfilePage({Key? key}) : super(key: key);

  @override
  _FacebookProfilePageState createState() => _FacebookProfilePageState();
}

class _FacebookProfilePageState extends State<FacebookProfilePage> {
  var profileData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Container(
        child: Center(
          child: _displayUserData(profileData),
          // child: isLoggedIn
          //     ? _displayUserData(profileData)
          //     : ProgressHUD(
          //         child: _displayLoginButton(), inAsyncCall: isLoading),
        ),
      ),
    );
  }

  _displayUserData(profileData) {
    return Column(
      children: <Widget>[
        Center(
          child: Container(
            margin: EdgeInsets.only(top: 80.0, bottom: 70.0),
            height: 160.0,
            width: 160.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  profileData['picture']['data']['url'],
                ),
                fit: BoxFit.cover,
              ),
              border: Border.all(color: Colors.blue, width: 5.0),
              borderRadius: BorderRadius.all(const Radius.circular(80.0)),
            ),
          ),
        ),
        Text(
          "Logged in as: ${profileData['name']}",
          style: TextStyle(
              color: Colors.blue, fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  _displayLoginButton() {
    return RaisedButton(
      child: Text(
        "Login with Facebook",
        style: TextStyle(color: Colors.white),
      ),
      color: Colors.blue,
      // onPressed: () => initiateFacebookLogin(),
      onPressed: () => {},
    );
  }
}
