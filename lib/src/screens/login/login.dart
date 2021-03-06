// ignore: use_key_in_widget_constructors
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:navamin/src/screens/menu/pokemoninfor.dart';
import 'package:navamin/src/screens/menu/pokemoninfor_hotmail.dart';
import 'package:navamin/src/screens/provider/google_sign_in.dart';
import 'package:navamin/src/screens/register/register.dart';
import 'package:navamin/src/services/authservice.dart';
import 'package:navamin/src/utils/toast.call.dart';
import 'package:navamin/src/widgets/appBg.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // ignore: unused_field
  // User _firebaseUser;
  final userController = TextEditingController();
  final passController = TextEditingController();
  // ignore: unused_field
  String _username = "";
  // ignore: unused_field
  String _password = "";
  bool rememberMe = false;
  bool _isHidden = true;
  bool isSignIn = false;

  final FirebaseAuth auth = FirebaseAuth.instance;

  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  Widget _buildUsernameTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 12),
          child: Text(
            'Email',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          height: 70.0,
          child: TextField(
            keyboardType: TextInputType.text,
            controller: userController,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              hintText: 'Email',
              hintStyle: TextStyle(fontSize: 16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              prefixIcon: Icon(
                Icons.mail_outline,
                color: Colors.black,
              ),
              filled: true,
              fillColor: Colors.white,
              // contentPadding: EdgeInsets.only(top: 14.0),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordTF(String hintText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 12),
          child: Text(
            'Password',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          height: 70.0,
          child: TextField(
            obscureText: _isHidden,
            controller: passController,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              hintText: 'Enter your Password',
              hintStyle: TextStyle(fontSize: 16),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    width: 3,
                  )),
              filled: true,
              fillColor: Colors.white,
              // contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock_outlined,
                color: Colors.black,
              ),
              suffixIcon: hintText == "Password"
                  ? IconButton(
                      onPressed: _toggleVisibility,
                      icon: _isHidden
                          ? Icon(Icons.visibility_off_outlined)
                          : Icon(Icons.visibility_outlined),
                    )
                  : null,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {
          signInWithMail();
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          // side: BorderSide(color: Colors.grey, width: 3)
        ),
        color: Colors.grey[600],
        child: Text(
          '?????????????????????????????????',
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 1.5,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'Neo Sans Arabie Medium',
          ),
        ),
      ),
    );
  }

  Widget _buildRegisterBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 0.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => Register()));
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          // side: BorderSide(color: Colors.grey, width: 3)
        ),
        color: Colors.grey[800],
        child: Text(
          '?????????????????????????????????',
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  Widget _buildTextSocial() {
    return Column(
      children: <Widget>[
        SizedBox(height: 40.0),
        Text(
          'Social Login',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  Widget _buildGoogleBtn() {
    return Column(
      children: <Widget>[
        SignInButton(
          Buttons.Google,
          onPressed: () {
            final provider =
                Provider.of<GoogleSignInProvider>(context, listen: false);
            provider.googleLogin();
          },
        )
      ],
    );
  }

  Widget _buildFacebookBtn() {
    return Column(
      children: <Widget>[
        SignInButton(
          Buttons.Facebook,
          onPressed: () {
            // AuthService().fbSignIn();
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              AppBackground(),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 20.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 40.0),
                      Text(
                        '?????????????????????????????????',
                        style: TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontFamily: 'OpenSans',
                        ),
                      ),
                      SizedBox(height: 20.0),
                      _buildUsernameTF(),
                      SizedBox(height: 10.0),
                      _buildPasswordTF('Password'),
                      SizedBox(height: 10.0),
                      _buildLoginBtn(),
                      _buildRegisterBtn(),
                      _buildTextSocial(),
                      SizedBox(height: 10),
                      _buildGoogleBtn(),
                      SizedBox(height: 10.0),
                      _buildFacebookBtn(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> signInWithMail() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: userController.text,
        password: passController.text,
      );
    } catch (e) {
      print(e.message);
      _username = userController.text;
      _password = passController.text;
      if (_username.isEmpty) {
        toast_short('Please Fill Username');
      } else if (_password.isEmpty) {
        toast_short('Please Fill Password');
      } else {
        toast_short('Login complete');
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => PokemonHotmailPage()));
      }
    }
  }
}
