import 'dart:convert';

import 'package:cefi_app/templates/listviewmarket.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'modules/nft.dart';
import 'modules/token.dart';

class Market extends StatefulWidget {
  const Market({Key? key}) : super(key: key);

  @override
  State<Market> createState() => _MarketState();
}

class _MarketState extends State<Market> {

  //GET THE DATA
  Future<List<Map<String,dynamic>>> getData()async{
   
   //URL
   var url = Uri.parse("localhost:3000/Market");
   //HTTP GET
   var data =await http.get(url);
  
  if(data.statusCode==200){
  var format = jsonDecode(data.body);
  return format;
  }else{
    return [];
  }

  }


  @override
  Widget build(BuildContext context) {
    //AN CONTAINER
    return Container(
      //MAKE HIM WHITE
      color: Colors.white,
      //COLUMN TO DISPLAY THE WIDGETS
      child: Column(
        children: <Widget>[
          //SOME PADDING
        Padding(
          padding: const EdgeInsets.all(15.0),
          //SAFE AREA
          child: SafeArea(
            //AN ROW WHICH WILL DISPLAY THE TITLE 
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              children: <Widget>[
                // ignore: prefer_const_constructors
                Text('Market',style: TextStyle(fontSize: 30,color: Color.fromARGB(255, 38, 69, 141),fontWeight: FontWeight.bold)),
                // ignore: prefer_const_constructors
                Icon(Icons.shopping_cart,size: 50,color: Color.fromARGB(255, 79, 38, 141),)
              ],
            ),
          ),
        ),
         //NOW THE LIST OF OFFERS
         FutureBuilder(
           builder:
           ((context, snapshot) {

           if(snapshot.connectionState==ConnectionState.done){
            var data = snapshot.data as List<Map<String,dynamic>>;
            return Expanded(
            //THE LISTVIEW BUILDER
           child: ListView(
            //DIRECTION OF THE SCROLL
            scrollDirection: Axis.vertical,
            //ENABLE SHRINK
            shrinkWrap: true,
            //CHILDREN
            children: 
            data.map((item){
            
            //AN CARD / TEMPLATE
            return Card(
              //THE COLOR OF THE CARD
            color: Color.fromARGB(255, 175, 174, 185),
            //THE SHAPE OF THE CARD BORDER
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            ),
            //WHAT IS INSIDE OF THE CARD ACCOURDING TO THE OBJECT TYPE INSIDE THE LIST UPWARD
            child: ListViewMarket(asset: item),
            );
            }).toList()
           
            ),
                );
           }else{

            return CircularProgressIndicator();

           }
            

           })
           
         )

      ],),
    );
  }
}