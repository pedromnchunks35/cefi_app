//DIALOG
// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:ui';

import 'package:cefi_app/templates/modules/item.dart';
import 'package:flutter/material.dart';


class Transfer extends StatefulWidget {
  Transfer({Key? key}) : super(key: key);

  @override
  State<Transfer> createState() => _TransferState();
}

class _TransferState extends State<Transfer> {
  //SOME OPTIONS
  List<Item> options = [
    Item(name: 'TST', icon: ImageIcon(AssetImage('assets/bogdanoff.jpg'),size: 20)),
    Item(name: 'Teste', icon: ImageIcon(AssetImage('assets/chunksup.png'),size:20)),
    Item(name: 'TST', icon: ImageIcon(AssetImage('assets/bogdanoff.jpg'),size: 20,)),
    Item(name: 'TST', icon: ImageIcon(AssetImage('assets/bogdanoff.jpg'),size: 20,)),
    Item(name: 'TST', icon: ImageIcon(AssetImage('assets/bogdanoff.jpg'),size: 20,)),
    Item(name: 'TST', icon: ImageIcon(AssetImage('assets/bogdanoff.jpg'),size: 20,)),
    Item(name: 'TST', icon: ImageIcon(AssetImage('assets/bogdanoff.jpg'),size: 20,)),
    Item(name: 'TST', icon: ImageIcon(AssetImage('assets/bogdanoff.jpg'),size: 20,)),
    Item(name: 'TST', icon: ImageIcon(AssetImage('assets/bogdanoff.jpg'),size: 20,)),
    Item(name: 'TST', icon: ImageIcon(AssetImage('assets/bogdanoff.jpg'),size: 20,)),
    Item(name: 'TST', icon: ImageIcon(AssetImage('assets/bogdanoff.jpg'),size: 20,)),
    Item(name: 'TST', icon: ImageIcon(AssetImage('assets/bogdanoff.jpg'),size: 20,)),
    Item(name: 'TST', icon: ImageIcon(AssetImage('assets/bogdanoff.jpg'),size: 20,)),
    Item(name: 'TST', icon: ImageIcon(AssetImage('assets/bogdanoff.jpg'),size: 20,)),
    Item(name: 'TST', icon: ImageIcon(AssetImage('assets/bogdanoff.jpg'),size: 20,)),
    Item(name: 'TST', icon: ImageIcon(AssetImage('assets/bogdanoff.jpg'),size: 20,))
  ];

  Item selected = Item(name: 'default', icon: ImageIcon(AssetImage('')));

  @override
  Widget build(BuildContext context) {
    //MAKE THE BACKGROUND BLUR
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      //CREATING THE DIALOG WIDGET
      child: Dialog(
      //MAKE THE SHAPE OF THE DIALOG CIRCULAR
      shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(100)
      ),
    //CREATING AN CONTAINER
    child: Container(
      height: 250,
      width: 200,
      color: Colors.white,
      child: Column(
      children: <Widget>[
      //THE CARD TO DISPLAY THE INFO
      Card(
      color: Colors.grey,
      //MAKE AN COLUMN
      child: Column(
      children: <Widget>[
      //AN ROW FOR HAVE THE TO AND THE PUBLIC ADDRESS THE USER WANTS TO SEND AHEAD
      Row(children: <Widget>[
      Text('To:',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20
      ),),
      //MAKE THE TEXTFORM FIELD EXPAND ACCOURDING TO HIS NECESSITIES
      Expanded(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10,0,0,0),
          //THE USER INPUT
          child: TextFormField(
            //SOME DECORATION
            decoration: InputDecoration(
              focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color.fromARGB(255, 57, 133, 50))
                        ),
              labelText: 'Public address'
            ),
          ),
        ),
      )  
      ],),

      //AN SIZED BOX
      SizedBox(height: 10),

      //NOW THE TOKEN WE WHICH TO CHOOSE
      Row(
        children: [
          Text('Token:',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20
          ),),
          SizedBox(width: 10,),
          //EXPAND WIDGET
          Expanded(
            //MAKE AN DROPDOWN BUTTON
            child: DropdownButtonFormField(
              //MAKE IT EXPANDED
              isExpanded: true,
                    //MAKE AN MAP FOR HAVE AN CERTAIN ITEMS INSIDE
                    items: options.map((Item op) {
                      //DROP DOWN MENU
                      return DropdownMenuItem(
                        value: op,
                        child: Row(
                          children: [
                            op.icon,
                            SizedBox(width: 10,),
                            Text(
                              op.name,
                              style:  TextStyle(color: Colors.red),
                            ),
                          ],
                        ),
                      );
                      //CONVERT IT TO AN LIST
                    }).toList() ,
                    //CHANGE THE STATE FOR GET THE CORRESPONDED VALUE
                    onChanged: (value) {
                      
                    },
                  ),
          ),


        ],
      ),

      TextField(
        decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color.fromARGB(255, 57, 133, 50))
                        ),
              labelText: 'Quantity'
        ),
      ),



      ],
      
      ) 
      ),
      
      Padding(
        padding: const EdgeInsets.all(8),
        child: TextButton(
        onPressed: (){}, 
        child: Padding(
          padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
          child: Text('Send',style: TextStyle(color: Colors.black,fontSize: 20),),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 30, 79, 120)),
        ),
        ),
      ),



      ],  
      )
    ),
    ),
    );
  }
}

 