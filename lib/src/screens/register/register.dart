import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:navamin/src/utils/control.dart';
import 'package:navamin/src/utils/toast.call.dart';
import 'package:navamin/src/widgets/appBg.dart';

class Register extends StatefulWidget {
  @override
  _RegisterformState createState() => _RegisterformState();
}

class _RegisterformState extends State<Register> {
  final FirebaseAuth mAuth = FirebaseAuth.instance;
  final double boxHeight = 30.0;
  final userController = TextEditingController();
  final passController = TextEditingController();
  final confirmCOntroller = TextEditingController();
  final emailController = TextEditingController();
  String _username = "";
  String _password = "";
  String _confirmpass = "";
  String _email = "";
  bool _isHidden_password = true;
  bool _isHidden_confirmpass = true;

  void _toggleVisibility() {
    setState(() {
      _isHidden_password = !_isHidden_password;
    });
  }

  void _toggleVisibility2() {
    setState(() {
      _isHidden_confirmpass = !_isHidden_confirmpass;
    });
  }

  Widget usernameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(left: 20.0, right: 20.0),
          child: TextField(
            keyboardType: TextInputType.text,
            controller: userController,
            style: TextStyle(
              color: Colors.black,
              //fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              hintText: 'ชื่อ-นามสกุล',
              hintStyle: TextStyle(fontSize: 16),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    width: 3,
                  )),
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.only(left: 20.0, top: 14.0),
              prefixIcon: Icon(
                Icons.people_outline,
                color: Colors.black,
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget emailField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(left: 20.0, right: 20.0),
          child: TextField(
            controller: emailController,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              hintText: 'Email',
              hintStyle: TextStyle(fontSize: 16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  width: 3,
                ),
              ),
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.only(left: 20.0, top: 14.0),
              prefixIcon: Icon(
                Icons.mail_outline,
                color: Colors.black,
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget PasswordField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(left: 20.0, right: 20.0),
          child: TextField(
            controller: passController,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              hintText: 'Password',
              hintStyle: TextStyle(fontSize: 16),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    width: 3,
                  )),
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.only(left: 47.0, top: 14.0),
              prefixIcon: Icon(
                Icons.lock_open_outlined,
                color: Colors.black,
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget confirmPasswordField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(left: 20.0, right: 20.0),
          child: TextField(
            obscureText: _isHidden_password,
            keyboardType: TextInputType.emailAddress,
            controller: confirmCOntroller,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              hintText: 'Confirm Password',
              hintStyle: TextStyle(fontSize: 16),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    width: 3,
                  )),
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.only(left: 20.0, top: 14.0),
              prefixIcon: Icon(
                Icons.lock_open_outlined,
                color: Colors.black,
              ),
              suffixIcon: IconButton(
                onPressed: _toggleVisibility,
                icon: _isHidden_password
                    ? Icon(Icons.visibility_off_outlined)
                    : Icon(Icons.visibility_outlined),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildRegisterBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 0.0),
      margin: EdgeInsets.only(left: 20.0, right: 20.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: _register,
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          // side: BorderSide(color: Colors.grey, width: 3)
        ),
        color: Colors.grey[600],
        child: Text(
          'สมัครสมาชิก',
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

  // void signUpWithEmailPass() {
  //   FirebeasUser user
  // }

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
                      horizontal: 10.0,
                      vertical: 20.0,
                    ),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: double.infinity,
                          alignment: Alignment.topLeft,
                          child: IconButton(
                            icon: Icon(Icons.arrow_back),
                            iconSize: 25,
                            color: Colors.white,
                            onPressed: () => Navigator.of(context).pop(true),
                          ),
                        ),
                        Text(
                          'สมัครสมาชิก',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        usernameField(),
                        SizedBox(
                          height: 10,
                        ),
                        emailField(),
                        SizedBox(
                          height: 10,
                        ),
                        PasswordField(),
                        SizedBox(
                          height: 10,
                        ),
                        confirmPasswordField(),
                        SizedBox(
                          height: 30,
                        ),
                        _buildRegisterBtn(),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }

  void _register() {
    _username = userController.text;
    _password = passController.text;
    _confirmpass = confirmCOntroller.text;
    _email = emailController.text;

    if (_username.isEmpty) {
      toast_short('Please Fill Username');
    } else if (_password.isEmpty) {
      toast_short('Please Fill Password');
    } else if (_confirmpass.isEmpty) {
      toast_short('Please Fill Repassword');
    } else if (_email.isEmpty) {
      toast_short('Please Fill Email');
    } else if (_password != _confirmpass) {
      toast_short('Password and confirmpassword must be equal');
    } else if (!(_email.contains(Control().hotmail) ||
        _email.contains(Control().gmail))) {
      toast_short('Email must have hotmail or gmail');
    } else if (!Control().validCharacters.hasMatch(_email)) {
      toast_short('Special Character is not allow');
    } else {
      toast_short('Register Completed');
      Navigator.of(context).pop(true);
    }
  }

  void _checkSpecificString() {}
}
