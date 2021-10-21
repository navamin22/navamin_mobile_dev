import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:navamin/src/screens/menu/pokemoninfor.dart';
import 'package:navamin/src/screens/register/register.dart';
import 'package:navamin/src/widgets/appBg.dart';

import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      home: LoginScreen(),
    );
  }
}

// ignore: use_key_in_widget_constructors
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
  // ignore: unused_field
  // bool _isFacebookLogin = false;
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  // final FacebookLogin _facebookLogin = FacebookLogin();
  // ignore: unused_field
  // User _userFacebook;

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
        onPressed: () => _loginCheck(),
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          // side: BorderSide(color: Colors.grey, width: 3)
        ),
        color: Colors.grey[600],
        child: Text(
          'เข้าสู่ระบบ',
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

  Widget _buildSignInWithText() {
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

  Widget _buildSocialBtn(Function onTap, AssetImage logo) {
    return GestureDetector(
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 2),
              blurRadius: 6.0,
            ),
          ],
          image: DecorationImage(
            image: logo,
          ),
        ),
      ),
    );
  }

  Widget _googleSignInBtn(Function onTap, AssetImage logo) {
    return GestureDetector(
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 2),
              blurRadius: 6.0,
            ),
          ],
          image: DecorationImage(
            image: logo,
          ),
        ),
      ),
    );
  }

  Widget _buildSocialBtnRow() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildSocialBtn(
            () => {
              // facebookLogin()
            },
            AssetImage(
              'assets/logos/facebook.jpg',
            ),
          ),
          _googleSignInBtn(
            () => {
              // googleSignIn()
            },
            AssetImage(
              'assets/logos/google.jpg',
            ),
          ),
        ],
      ),
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
                      SizedBox(
                        height: 40.0,
                      ),
                      Text(
                        'เข้าสู่ระบบ',
                        style: TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontFamily: 'OpenSans',
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      _buildUsernameTF(),
                      SizedBox(
                        height: 10.0,
                      ),
                      _buildPasswordTF('Password'),
                      SizedBox(
                        height: 10.0,
                      ),
                      // _buildRememberMeCheckbox(),
                      // _buildForgotPasswordBtn(),
                      _buildLoginBtn(),
                      _buildRegisterBtn(),
                      _buildSignInWithText(),
                      _buildSocialBtnRow(),
                      // _buildSignupBtn(),
                      SizedBox(
                        height: 20.0,
                      ),
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

  void _loginCheck() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => PokemonPage(
              title: '',
            )));

    // _username = userController.text;
    // _password = passController.text;
    // if(_username.isEmpty){
    //   toast_short('Please Fill Username');
    // } else if(_password.isEmpty){
    //   toast_short('Please Fill Password');
    // } else {
    //   if(_username == 'admin' && _password == '1234'){
    //     toast_short('Welcome Admin');
    //     Navigator.of(context)
    //         .push(
    //         MaterialPageRoute(builder: (context) => HomeScreen())
    //     );
    //   } else {
    //     toast_short('Username or Password Incorrect');
    //   }
    // }
  }

  // void googleSignIn() {
  //   Route route = MaterialPageRoute(builder: (context) => HomeScreen());
  //   GoogleAuth().signInWithGoogle().then((user) => {
  //     // this._firebaseUser = user,
  //     Navigator.pushReplacement(context, route)
  //   });
  // }

  // void facebookLogin() {
  //   Route route = MaterialPageRoute(builder: (context) => HomeScreen());
  //   handleLogin().then((user) => {
  //     this._firebaseUser = user,
  //     Navigator.pushReplacement(context, route)
  //   });
  // }

  // Future handleLogin() async {
  //   final FacebookLoginResult result = await _facebookLogin.logIn(['email']);
  //   switch (result.status) {
  //     case FacebookLoginStatus.cancelledByUser:
  //       break;
  //     case FacebookLoginStatus.error:
  //       break;
  //     case FacebookLoginStatus.loggedIn:
  //       try {
  //         await loginWithFacebook(result);
  //       } catch (e) {
  //         print(e);
  //       }
  //       break;
  //   }
  // }

  // Future<User> loginWithFacebook(FacebookLoginResult result) async {
  //   final FacebookAccessToken accessToken = result.accessToken;

  //   final AuthCredential credential = FacebookAuthProvider.credential(
  //       accessToken.token
  //   );

  //   final UserCredential authResult = await _auth.signInWithCredential(credential);
  //   final User user = authResult.user;

  //   assert(!user.isAnonymous);
  //   assert(await user.getIdToken() != null);

  //   final User currentUser = _auth.currentUser;
  //   assert(currentUser.uid == user.uid);
  //   print('Facebook user is $user}');

  //   return user;
  // }

  // Future signInUsingFacebook(BuildContext context) async {
  //   final FacebookLogin facebookLogin = FacebookLogin();
  //   final FacebookLoginResult result = await facebookLogin.logIn(['email']);

  // String token = result.accessToken.token;
  // print("Access token = $token");
  // await _auth.signInWithCredential(
  //   FacebookAuthProvider.credential(accessToken: token));
  //
  // FacebookAccessToken facebookAccessToken = result.accessToken;
  // AuthCredential authCredential = FacebookAuthProvider.credential(
  //     accessToken: facebookAccessToken.token,
  //     idToken
  // );

  // switch (facebookLoginResult.status) {
  //   case FacebookLoginStatus.loggedIn:
  //     FirebaseAuth.instance
  //         .signInWithCredential(
  //       FacebookAuthProvider.getCredential(
  //           accessToken: facebookLoginResult.accessToken.token),
  //     ).then((user) async {
  //
  //       // Navigator.pushReplacement(
  //       //   context,
  //       //   MaterialPageRoute(
  //       //     builder: (context) => UserProfile(),
  //       //   ),
  //       // );
  //
  //     });
  //
  //     break;
  //
  //   case FacebookLoginStatus.cancelledByUser:
  //     break;
  //
  //   case FacebookLoginStatus.error:
  //     break;
  // }
}
