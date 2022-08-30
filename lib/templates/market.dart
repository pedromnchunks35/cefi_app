import 'package:cefi_app/templates/listviewmarket.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'modules/nft.dart';
import 'modules/token.dart';

class Market extends StatefulWidget {
  const Market({Key? key}) : super(key: key);

  @override
  State<Market> createState() => _MarketState();
}

class _MarketState extends State<Market> {

  List<Object> test = [
  Nft(name: 'Pedro', price: '200'),
  Token(name: 'TST', quantity: '20', price: '2.0',photo: 'chunksup.png'),
  Token(name: 'test', quantity: '20', price: '3.0', photo: 'bogdanoff.jpg'),
  Token(name: 'test', quantity: '20', price: '3.0', photo: 'bogdanoff.jpg'),
  Token(name: 'test', quantity: '20', price: '3.0', photo: 'bogdanoff.jpg'),
  Token(name: 'test', quantity: '20', price: '3.0', photo: 'bogdanoff.jpg'),
  Token(name: 'test', quantity: '20', price: '3.0', photo: 'bogdanoff.jpg'),
  Token(name: 'test', quantity: '20', price: '3.0', photo: 'bogdanoff.jpg'),
  Token(name: 'test', quantity: '20', price: '3.0', photo: 'bogdanoff.jpg'),
  Token(name: 'test', quantity: '20', price: '3.0', photo: 'bogdanoff.jpg'),
  ];
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
         Expanded(
          //THE LISTVIEW BUILDER
         child: ListView.builder(
          //DIRECTION OF THE SCROLL
          scrollDirection: Axis.vertical,
          //ENABLE SHRINK
          shrinkWrap: true,
          //LENGTH OF THE ITEMS
         itemCount: test.length,
         //ITEM BUILDER
         itemBuilder: (BuildContext context, int index) { 
          //AN CARD / TEMPLATE
          return Card(
            //THE COLOR OF THE CARD
          color: Color.fromARGB(255, 175, 174, 185),
          //THE SHAPE OF THE CARD BORDER
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          ),
          //WHAT IS INSIDE OF THE CARD ACCOURDING TO THE OBJECT TYPE INSIDE THE LIST UPWARD
          child: ListViewMarket(asset: test[index]),
          );
          }),
       )

      ],),
    );
  }
}