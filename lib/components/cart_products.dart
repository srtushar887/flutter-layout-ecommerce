import 'package:flutter/material.dart';


class Cart_products extends StatefulWidget {
  @override
  _Cart_productsState createState() => _Cart_productsState();
}

class _Cart_productsState extends State<Cart_products> {

  var Products_on_cart = [
    {
      "name" :"Blazer",
      "picture" :"images/products/blazer1.jpeg",
      "old_price" :100,
      "price" :80,
      "size" : "M",
      "color" : "red",
      "quantity" : 1
    },
    {
      "name" :"Blazer 2",
      "picture" :"images/products/blazer2.jpeg",
      "old_price" :110,
      "price" :90,
      "size" : "L",
      "color" : "blue",
      "quantity" : 2
    },
    {
      "name" :"Dress 1",
      "picture" :"images/products/dress1.jpeg",
      "old_price" :120,
      "price" :100,
      "size" : "XL",
      "color" : "black",
      "quantity" : 3
    },
    {
      "name" :"Dress 2",
      "picture" :"images/products/dress2.jpeg",
      "old_price" :130,
      "price" :110,
      "size" : "XL",
      "color" : "black",
      "quantity" : 3
    },



  ];

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: Products_on_cart.length,
        itemBuilder: (context, index){
          return Single_cart_product(
            cart_product_name: Products_on_cart[index]["name"],
            cart_product_color: Products_on_cart[index]["color"],
            cart_product_picture: Products_on_cart[index]["picture"],
            cart_product_price: Products_on_cart[index]["price"],
            cart_product_size: Products_on_cart[index]["size"],
            cart_product_qty: Products_on_cart[index]["quantity"],

          );
        }

    );
  }
}



class Single_cart_product extends StatelessWidget {

  final cart_product_name;
  final cart_product_picture;
  final cart_product_price;
  final cart_product_size;
  final cart_product_color;
  final cart_product_qty;

  Single_cart_product({
    this.cart_product_name,
    this.cart_product_picture,
    this.cart_product_price,
    this.cart_product_size,
    this.cart_product_color,
    this.cart_product_qty,
  });


  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: new Image.asset(cart_product_picture,width: 50.0,),
        title: new Text(cart_product_name),
        subtitle: new Column(
          children: <Widget>[
            new Row(
              children: <Widget>[
                
                Padding(
                    padding: const EdgeInsets.all(0.0),
                  child: new Text("size:"),
                ),

                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: new Text(cart_product_size,style: TextStyle(color: Colors.red),),
                ),
                
                new Padding(padding: const EdgeInsets.fromLTRB(20.0,8.0,8.0,8.0),
                  child: new Text("Color:"),
                ),

                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: new Text(cart_product_color),
                ),

              ],
            ),



          new Container(
            alignment: Alignment.topLeft,
            child: new Text("\TK.${cart_product_price}",style: TextStyle(fontSize: 17.0,fontWeight: FontWeight.bold,color: Colors.red),),
          )
            




          ],
        ),

        trailing:
        FittedBox(
          fit: BoxFit.fill,
          child: Column(
            children: <Widget>[
              new IconButton(icon: Icon(Icons.arrow_drop_up),iconSize: 100, onPressed: (){}),
              new Text("${cart_product_qty}",style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold),),
              new IconButton(icon: Icon(Icons.arrow_drop_up),iconSize: 100, onPressed: (){}),
            ],
          ),
        )





      ),
    );
  }
}



