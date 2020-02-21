import 'package:flutter/material.dart';

import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter_ecom/components/horizontal_listview.dart';
import 'package:flutter_ecom/components/products.dart';
import 'package:flutter_ecom/pages/cart.dart';


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_ecom/pages/login.dart';



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  _signOut() async {
    await firebaseAuth.signOut();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => new Login()));
  }

  @override
  Widget build(BuildContext context) {

    Widget image_carousel = new Container(
      height: 300.0,
      child: new Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('images/c1.jpg'),
          AssetImage('images/m1.jpeg'),
          AssetImage('images/m2.jpg'),
          AssetImage('images/w1.jpeg'),
          AssetImage('images/w3.jpeg'),
          AssetImage('images/w4.jpeg'),
        ],

        autoplay: true,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
        dotSize: 6.0,
        indicatorBgPadding: 8.0,
        dotBgColor: Colors.transparent,


      ),

    );



    return Scaffold(
      appBar: new AppBar(
        elevation: 0.1,
        backgroundColor: Colors.blue,
        title: Text("World Mart"),
        actions: <Widget>[
          new IconButton(icon: Icon(Icons.search,color: Colors.white,), onPressed: (){}),
          new IconButton(icon: Icon(Icons.shopping_cart,color: Colors.white,), onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => new Cart()));
          }),
        ],
      ),

      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[

            //header
            new UserAccountsDrawerHeader(
              accountName: Text('Tusher'),
              accountEmail: Text('tushartrx@gmail.com'),
              currentAccountPicture: GestureDetector(
                child: new CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.person,color: Colors.white,),

                ),
              ),

              decoration: new BoxDecoration(
                  color: Colors.blueGrey
              ),

            ),




            //body

            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Home'),
                leading: Icon(Icons.home,color: Colors.red,),

              ),
            ),

            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('My Account'),
                leading: Icon(Icons.person),

              ),
            ),


            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('My Order'),
                leading: Icon(Icons.shopping_basket),

              ),
            ),



            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => new Cart()));
              },
              child: ListTile(
                title: Text('Shopping card'),
                leading: Icon(Icons.shopping_cart,color: Colors.red,),

              ),
            ),



            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Favourites'),
                leading: Icon(Icons.favorite,color: Colors.red,),

              ),
            ),

            Divider(),

            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Settings'),
                leading: Icon(Icons.settings),

              ),
            ),

            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('About'),
                leading: Icon(Icons.help,color: Colors.blue,),

              ),
            ),


            InkWell(
              onTap: (){
                _signOut();
              },
              child: ListTile(
                title: Text('Log Out'),
                leading: Icon(Icons.input,color: Colors.red,),

              ),
            ),

          ],
        ),
      ),




      body: new ListView(
        children: <Widget>[

          //image carosule code
          image_carousel,

          //padding widget
          new Padding(padding: const EdgeInsets.all(20.0),
            child: Container(
                alignment: Alignment.centerLeft,
                child: new Text('Categories')
            ),
          ),


          //horizontal list view
          HorizontalList(),



          //padding widget
          new Padding(padding: const EdgeInsets.all(20.0),
            child: Container(
              alignment: Alignment.centerLeft,
              child: new Text('Recent Products'),
            ),

          ),

          //grid view




          Container(
            height: 300.0,
            child: Products(),
          )


        ],
      ),



    );
  }
}
