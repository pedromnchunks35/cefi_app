// ignore_for_file: prefer_const_constructors

import 'package:cefi_app/templates/listviewW.dart';
import 'package:cefi_app/templates/modules/nft.dart';
import 'package:cefi_app/templates/modules/token.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../templates/transferdialog.dart';

class Wallet extends StatefulWidget {
  const Wallet({Key? key}) : super(key: key);

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {

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
    //RETURN AN CONTAINER
    return Container(
      //THE COLOR OF THE CONTAINER
      color: Colors.white,
      //THE COLUMN
      child: Column(
        //THE WIDGETS
      children: <Widget>[
        //PADDING OVER THE WIDGETS
       Padding(
         padding: const EdgeInsets.all(15.0),
         //SAFE AREA
         child: SafeArea(
           //SIMPLE CARD FOR THE BALANCE
           child: Card(
             //THE SHAPE OF THE CARD BORDER
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              //COLOR OF THE CARD
              color: Color.fromARGB(255, 38, 69, 141),
              //SOME SHADOW
              elevation: 10,
              //THE CHILD OF THE CARD WHICH IS THE BALANCE
              child: 
              //THE LIST INSIDE THE CARD
              ListTile(
                //THE ICON
                leading: Icon(Icons.wallet_giftcard , size: 50,),
                //THE TITLE
                title: Text('Balance',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20)),
                //THE SUBTITLE
                subtitle: Text('2000€',style: TextStyle(color: Color.fromARGB(255, 195, 181, 181),fontWeight: FontWeight.bold),),
                
              ),
               

               ),
         ),
       ),
       
       TextButton.icon(onPressed: (){
        showDialog(
          context: context, 
          builder: ((context) => Transfer()));
       }, 
       icon: Icon(Icons.transform,size: 30,color: Colors.black,),
       label: Text('Transfer',style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 17
       ),),
       style: ButtonStyle(
       backgroundColor: MaterialStateProperty.all(Colors.blue),
       elevation: MaterialStateProperty.all(20),
       side: MaterialStateProperty.all(BorderSide(color: Colors.black,width: 2)
       ),),
       ),



       Expanded(
         child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
         itemCount: test.length,
         itemBuilder: (BuildContext context, int index) { 
          return Card(
          color: Color.fromARGB(255, 175, 174, 185),
          //THE SHAPE OF THE CARD BORDER
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          ),
          //WHAT IS INSIDE OF THE CARD ACCOURDING TO THE OBJECT TYPE INSIDE THE LIST UPWARD
          child: ListViewWidget(asset: test[index])
          );
          }),
       )

      ],
      ),
    );
  }
}