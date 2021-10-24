import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:navamin/src/screens/login/login.dart';
import 'package:navamin/src/screens/menu/pokemoninfor_facebook.dart';

class AuthService {
  //Determine if the user is authenticated.
  handleAuth() {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return PokemonFacebookPage();
          } else
            return LoginScreen();
        });
  }

  //Sign out
  signOut() {
    FirebaseAuth.instance.signOut();
  }

  //fb signin

//   fbSignIn() async {
//     final fb = FacebookLogin();

// // Log in
//     final res = await fb.logIn(permissions: [
//       FacebookPermission.publicProfile,
//       FacebookPermission.email,
//     ]);

// // Check result status
//     switch (res.status) {
//       case FacebookLoginStatus.success:
//         // Logged in

//         // Send access token to server for validation and auth
//         final FacebookAccessToken accessToken = res.accessToken;
//         final AuthCredential authCredential =
//             FacebookAuthProvider.credential(accessToken.token);
//         final result =
//             await FirebaseAuth.instance.signInWithCredential(authCredential);

//         // Get profile data
//         final profile = await fb.getUserProfile();
//         print('Hello, ${profile.name}! You ID: ${profile.userId}');

//         // Get user profile image url
//         final imageUrl = await fb.getProfileImageUrl(width: 100);
//         print('Your profile image: $imageUrl');

//         // Get email (since we request email permission)
//         final email = await fb.getUserEmail();
//         // But user can decline permission
//         if (email != null) print('And your email is $email');

//         break;
//       case FacebookLoginStatus.cancel:
//         // User cancel log in
//         break;
//       case FacebookLoginStatus.error:
//         // Log in failed
//         print('Error while log in: ${res.error}');
//         break;
//     }
//   }
}
