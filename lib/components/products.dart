import 'package:flutter/material.dart';
import 'package:flutter_ecom/pages/product_details.dart';


class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {

  var product_list = [
    {
     "name" :"Blazer",
     "picture" :"images/products/blazer1.jpeg",
     "old_price" :100,
     "price" :80,
    },
    {
      "name" :"Blazer 2",
      "picture" :"images/products/blazer2.jpeg",
      "old_price" :110,
      "price" :90,
    },
    {
      "name" :"Dress 1",
      "picture" :"images/products/dress1.jpeg",
      "old_price" :120,
      "price" :100,
    },
    {
      "name" :"Dress 2",
      "picture" :"images/products/dress2.jpeg",
      "old_price" :130,
      "price" :110,
    },
    {
      "name" :"Hills 1",
      "picture" :"images/products/hills1.jpeg",
      "old_price" :130,
      "price" :110,
    },
    {
      "name" :"Hills 2",
      "picture" :"images/products/hills2.jpeg",
      "old_price" :130,
      "price" :110,
    },
    {
      "name" :"Pants",
      "picture" :"images/products/pants2.jpeg",
      "old_price" :130,
      "price" :110,
    },
    {
      "name" :"Skt",
      "picture" :"images/products/skt1.jpeg",
      "old_price" :130,
      "price" :110,
    },
    {
      "name" :"Skt 2",
      "picture" :"images/products/skt2.jpeg",
      "old_price" :130,
      "price" :110,
    },
    {
      "name" :"Skt 4",
      "picture" :"images/c1.jpg",
      "old_price" :140,
      "price" :110,
    },
    {
      "name" :"Skt 5",
      "picture" :"images/m1.jpeg",
      "old_price" :150,
      "price" :110,
    },

  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: product_list.length,
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2
        ),
        itemBuilder: (BuildContext context, int index){
            return Single_prod(
              product_name: product_list[index]['name'],
              product_picture: product_list[index]['picture'],
              product_old_price: product_list[index]['old_price'],
              product_price: product_list[index]['price'],
            );
        },
    );
  }
}



class Single_prod extends StatelessWidget {

  final product_name;
  final product_picture;
  final product_old_price;
  final product_price;

  Single_prod({
    this.product_name,
    this.product_picture,
    this.product_old_price,
    this.product_price,
});


  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
        tag: new Text("Hero One"),
        child: Material(
          child: InkWell(
            onTap: () => Navigator.of(context).push(
                new MaterialPageRoute(builder: (context) => new ProductDetails(

                  //passing product data in paramiter

                  product_details_name: product_name,
                  product_details_new_price: product_price,
                  product_details_old_price: product_old_price,
                  product_details_picture: product_picture,

                ))
            ),
            child: GridTile(
              footer: Container(
                color: Colors.white,
                child: new Row(
                  children: <Widget>[
                    Expanded(
                      child: new Text(product_name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.0),),
                    ),

                    new Text("\TK.${product_price}",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),

                  ],
                )
              ),
                child: Image.asset(
                    product_picture,
                  fit: BoxFit.cover,
                ),
            ),
          ),
        ),
      ),
    );
  }
}

