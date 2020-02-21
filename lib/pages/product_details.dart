import 'package:flutter/material.dart';
import 'package:flutter_ecom/main.dart';
import 'package:flutter_ecom/pages/home.dart';


class ProductDetails extends StatefulWidget {

  final product_details_name;
  final product_details_new_price;
  final product_details_old_price;
  final product_details_picture;

  ProductDetails({
    this.product_details_name,
    this.product_details_new_price,
    this.product_details_old_price,
    this.product_details_picture,
});


  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.1,
        backgroundColor: Colors.blue,
        title: InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));
          },
            child: Text("Product Details")
        ),
        actions: <Widget>[
          new IconButton(icon: Icon(Icons.search,color: Colors.white,), onPressed: (){}),
        ],
      ),


      body: new ListView(
        children: <Widget>[
          new Container(
            height: 300.0,
            child: GridTile(
                child: Container(
                  color: Colors.white,
                  child: Image.asset(widget.product_details_picture),
                ),
              
              footer: new Container(
                color: Colors.white70,
                child: ListTile(
                  leading: new Text(
                      widget.product_details_name,
                  style: TextStyle(fontWeight: FontWeight.w800,fontSize: 18.0),
                  ),
                  title: new Row(
                    children: <Widget>[
                      Expanded(
                        child: new Text("\TK.${widget.product_details_old_price}",
                        style: TextStyle(color: Colors.grey,decoration: TextDecoration.lineThrough),
                        ),
                      ),
                      Expanded(
                        child: new Text("\TK.${widget.product_details_new_price}",
                          style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            ),

          ),

        //  this first button
        Row(
          children: <Widget>[
            Expanded(
              child: MaterialButton(
                onPressed: (){
                  showDialog(
                    context: context,
                    builder: (context){
                      return new AlertDialog(
                        title: new Text("Size"),
                        content: new Text("Choose the size"),
                        actions: <Widget>[
                          new MaterialButton(onPressed: (){
                            Navigator.of(context).pop(context);
                          },
                          child: new Text("close"),
                          )
                        ],
                      );
                    }
                  );
                },
                color: Colors.white,
                textColor: Colors.grey,
                elevation: 0.2,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: new Text('Size '),
                    ),
                    Expanded(
                      child: new Icon(Icons.arrow_drop_down),
                    ),

                  ],
                ),
              ),
            ),



            Expanded(
              child: MaterialButton(
                onPressed: (){
                  showDialog(
                      context: context,
                      builder: (context){
                        return new AlertDialog(
                          title: new Text("Color"),
                          content: new Text("Choose the Color"),
                          actions: <Widget>[
                            new MaterialButton(onPressed: (){
                              Navigator.of(context).pop(context);
                            },
                              child: new Text("close"),
                            )
                          ],
                        );
                      }
                  );
                },
                color: Colors.white,
                textColor: Colors.grey,
                elevation: 0.2,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: new Text('Color '),
                    ),
                    Expanded(
                      child: new Icon(Icons.arrow_drop_down),
                    ),

                  ],
                ),
              ),
            ),




            Expanded(
              child: MaterialButton(
                onPressed: (){
                  showDialog(
                      context: context,
                      builder: (context){
                        return new AlertDialog(
                          title: new Text("Qtantity"),
                          content: new Text("Choose the Color"),
                          actions: <Widget>[
                            new MaterialButton(onPressed: (){
                              Navigator.of(context).pop(context);
                            },
                              child: new Text("close"),
                            )
                          ],
                        );
                      }
                  );
                },
                color: Colors.white,
                textColor: Colors.grey,
                elevation: 0.2,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: new Text('Qty '),
                    ),
                    Expanded(
                      child: new Icon(Icons.arrow_drop_down),
                    ),

                  ],
                ),
              ),
            )




          ],
        ),






//  this second button
          Row(
            children: <Widget>[
              Expanded(
                child: MaterialButton(
                  onPressed: (){},
                  color: Colors.red,
                  textColor: Colors.white,
                  elevation: 0.2,
                  child: new Text("Buy Now",style: TextStyle(color: Colors.white),)
                ),
              ),


              new IconButton(icon: Icon(Icons.add_shopping_cart),onPressed: (){},color: Colors.red,),
              new IconButton(icon: Icon(Icons.favorite_border),onPressed: (){},color: Colors.red,),
              
            ],
          ),




          Divider(color: Colors.grey,),
          new ListTile(
            title: new Text("Product Details"),
            subtitle: new Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum"),
          ),

          Divider(color: Colors.grey,),
          
          Row(
            children: <Widget>[
              Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
              child: new Text('Product Name',style: TextStyle(color: Colors.grey),),
              ),
              
              Padding(padding: EdgeInsets.all(5.0),
              child: new Text(widget.product_details_name),
              ),
              
            ],
          ),


          Row(
            children: <Widget>[
              Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text('Product Brand',style: TextStyle(color: Colors.grey),),
              ),

              Padding(padding: EdgeInsets.all(5.0),
                child: new Text(widget.product_details_name),
              ),

            ],
          ),

          Row(
            children: <Widget>[
              Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text('Product Condition',style: TextStyle(color: Colors.grey),),
              ),

              Padding(padding: EdgeInsets.all(5.0),
                child: new Text(widget.product_details_name),
              ),
            ],
          ),

          Divider(),
        Padding(padding : const EdgeInsets.all(8.0),child: new Text("Similar Product")),
        //similar product section
          Container(
            height: 420.0,
            child: Similar_product(),
          )





        ],
      ),


    );
  }
}



class Similar_product extends StatefulWidget {
  @override
  _Similar_productState createState() => _Similar_productState();
}

class _Similar_productState extends State<Similar_product> {


  var product_list = [

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

  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: product_list.length,
      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2
      ),
      itemBuilder: (BuildContext context, int index){
        return Similar_single_prod(
          product_name: product_list[index]['name'],
          product_picture: product_list[index]['picture'],
          product_old_price: product_list[index]['old_price'],
          product_price: product_list[index]['price'],
        );
      },
    );
  }
}


class Similar_single_prod extends StatelessWidget {

  final product_name;
  final product_picture;
  final product_old_price;
  final product_price;

  Similar_single_prod({
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

