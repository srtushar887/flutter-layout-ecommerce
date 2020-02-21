import 'package:flutter/material.dart';


import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_ecom/pages/home.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final GoogleSignIn googleSignIn = new GoogleSignIn();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  SharedPreferences preferences;
  bool loading = false;
  bool isLogedin = false;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isSignedIn();
  }

  void isSignedIn() async{
    setState(() {
      loading = true;
    });


    preferences = await SharedPreferences.getInstance();
    isLogedin = await googleSignIn.isSignedIn();

    if(isLogedin){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => new HomePage()));
    }

    setState(() {
      loading = false;
    });

  }


  Future handleSignIN() async{
    preferences = await SharedPreferences.getInstance();
    setState(() {
      loading = true;
    });

  GoogleSignInAccount googleUser = await googleSignIn.signIn();
  GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    final AuthResult authResult = await firebaseAuth.signInWithCredential(credential);
    FirebaseUser firebaseUser = authResult.user;

    if(FirebaseUser != null){
      final QuerySnapshot result = await Firestore.instance.collection("users").where("id", isEqualTo: firebaseUser.uid).getDocuments();
      final List<DocumentSnapshot> documents = result.documents;
      if(documents.length == 0){
        //insert the user in collection
        Firestore.instance
            .collection("users")
            .document(firebaseUser.uid)
            .setData({
          "id" : firebaseUser.uid,
          "username" : firebaseUser.displayName,
          "profilePicture" : firebaseUser.photoUrl

        });
        await preferences.setString("id", firebaseUser.uid);
        await preferences.setString("username", firebaseUser.displayName);
        await preferences.setString("photoUrl", firebaseUser.displayName);

      }else{
        await preferences.setString("id", documents[0]['id']);
        await preferences.setString("username", documents[0]['username']);
        await preferences.setString("photoUrl", documents[0]['photoUrl']);
      }

      Fluttertoast.showToast(msg: "Login was successfull");
      setState(() {
        loading = false;
      });


      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));

    }else{
      Fluttertoast.showToast(msg: "Sorry !Login Falied");
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Login()));
    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Visibility(
            visible: loading ?? true,
              child: Container(
                alignment: Alignment.center,
                color: Colors.white.withOpacity(0.9),
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                ),
              )
          )


        ],
      ),

      bottomNavigationBar: Container(
        child: Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 12.0,right: 12.0,top: 8.0,bottom: 8.0),
              child: FlatButton(onPressed: (){
                handleSignIN();
              },
                color: Colors.red.shade800,
                child: Text("Sign In", style: TextStyle(color: Colors.white),
                ),
              ),
            ),
        ),
      ),

      
    );
    
    
    
    
  }


}

