import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:navamin/src/screens/provider/google_sign_in.dart';
import 'package:navamin/src/utils/colors.dart';
import 'package:navamin/src/widgets/appBg.dart';
import 'package:provider/provider.dart';

class PokemonPage extends StatefulWidget {
  final String title;

  const PokemonPage({Key key, this.title}) : super(key: key);
  @override
  _PokemonPageState createState() => _PokemonPageState();
}

class _PokemonPageState extends State<PokemonPage> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Container(
          child: Column(
            children: [
              Text('Name: ' + user.displayName,
                  style: TextStyle(color: Colors.white, fontSize: 16)),
              Text(
                'Email: ' + user.email,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
          ),
        ),
        titleSpacing: 1,
        leading: CircleAvatar(
          radius: 10,
          backgroundImage: NetworkImage(user.photoURL),
        ),
        actions: [
          IconButton(
            onPressed: () {
              final provider =
                  Provider.of<GoogleSignInProvider>(context, listen: false);
              provider.logout();
            },
            icon: Icon(Icons.logout_outlined),
          ),
        ],
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))),
        backgroundColor: Colors.lightGreen[600],
        elevation: 0,
      ),

      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: GridView(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'ชื่อโปเกม่อน',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'ชื่อโปเกม่อน',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'ชื่อโปเกม่อน',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'ชื่อโปเกม่อน',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ],
                ),
              ),
            ],
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
          ),
        ),
      ),
      // body: AnnotatedRegion<SystemUiOverlayStyle>(
      //   value: SystemUiOverlayStyle.light,
      //   child: GestureDetector(
      //     onTap: () => FocusScope.of(context).unfocus(),
      //     child: Stack(
      //       children: <Widget>[
      //         AppBackground(),
      //         Container(
      //           height: double.infinity,
      //           child: SingleChildScrollView(
      //             physics: AlwaysScrollableScrollPhysics(),
      //             padding: EdgeInsets.symmetric(
      //               horizontal: 10.0,
      //               vertical: 10.0,
      //             ),
      //             child: Column(
      //               mainAxisAlignment: MainAxisAlignment.center,
      //               children: <Widget>[

      //               ],
      //             ),
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
