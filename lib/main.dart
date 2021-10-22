import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:navamin/src/screens/login/login.dart';
import 'package:navamin/src/screens/menu/pokemoninfor.dart';
import 'package:navamin/src/screens/provider/google_sign_in.dart';
import 'package:navamin/src/screens/register/register.dart';
import 'package:navamin/src/widgets/appBg.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child: MaterialApp(
        theme: ThemeData(),
        home: LoginScreen(),
      ));
}
