import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:navamin/src/screens/login/login.dart';
import 'package:navamin/src/screens/provider/google_sign_in.dart';
import 'package:provider/provider.dart';

class PokemonFacebookPage extends StatefulWidget {
  final String title;

  const PokemonFacebookPage({Key key, this.title}) : super(key: key);
  @override
  _PokemonFacebookPageState createState() => _PokemonFacebookPageState();
}

class _PokemonFacebookPageState extends State<PokemonFacebookPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Container(
          child: Column(
            children: [
              // Text(
              //   'Email: ' + auth..toString(),
              //   style: TextStyle(color: Colors.white, fontSize: 16),
              // ),
              Text('email'),
            ],
          ),
        ),
        titleSpacing: 1,
        // leading: CircleAvatar(
        //   radius: 10,
        //   backgroundImage: NetworkImage(user.photoURL),
        // ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => LoginScreen()));
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
    );
  }
}
