// ignore_for_file: unnecessary_string_interpolations, prefer_const_constructors, sort_child_properties_last

import 'package:cefi_app/templates/modules/nft.dart';
import 'package:cefi_app/templates/modules/token.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ListViewWidget extends StatefulWidget {
  ListViewWidget({Key? key,required Object this.asset}) : super(key: key);
   
  Object asset;

  @override
  State<ListViewWidget> createState() => _ListViewWidgetState();
}

class _ListViewWidgetState extends State<ListViewWidget> {
  @override
  Widget build(BuildContext context) {
    //CHECK THE TYPE OF THE ASSET
    if(widget.asset is Nft){
      //CASE NFT
      return Row(
        //MAKE SPACE BETWEEN TWO CONTAINERS
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
        //CONTAINER ONE WHICH WILL DISPLAY THE ICON AND SYMBOL && NAME
        Row(
          children: [
            //THE IMAGE
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                image: DecorationImage(image: AssetImage('assets/bogdanoff.jpg')),
              ),
            ),

           //SOME SPACE
           SizedBox(width: 10),

            //THE SYMBOL AND NAME OF THE NFT
            Column(
              children: [
                Text('SYMBOL',style: TextStyle(
                color: Color.fromARGB(255, 38, 69, 141),
                fontWeight: FontWeight.bold,
                fontSize: 16
                )),
                Text('${(widget.asset as Nft).name}',style: TextStyle(
                  color: Color.fromARGB(255, 231, 233, 237),
                  fontWeight: FontWeight.bold,
                  fontSize: 13
                ))
              ],
            ),
          ],
        ),


        //THE SECOUND CONTAINER WHICH WILL DISPLAY THE PRICE OF THE NFT AND AN BUTTON TO SELL IT
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: Row(
             children: [
               Text('${(widget.asset as Nft).price}€',style: TextStyle(
                  color: Color.fromARGB(255, 231, 233, 237),
                  fontWeight: FontWeight.bold,
                  fontSize: 13
                )),
                SizedBox(width: 10,),
               TextButton(onPressed: (){},  child: Text('Sell',style: TextStyle(
                  color: Color.fromARGB(255, 38, 69, 141),
                  fontWeight: FontWeight.bold,
                  fontSize: 16
                  )),style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 232, 231, 234))))
             ],
           ),
         ),

        ],
      );

    }else{
      //CASE ITS A TOKEN
      return Row(
        //MAKE SPACE BETWEEN TWO CONTAINERS
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          //FIRST CONTAINER WHICH AS THE ICON AND THE NAME/SYMBOL OF THE TOKEN
        Row(
          children: [
            //THE IMAGE
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                image: DecorationImage(image: AssetImage('assets/${(widget.asset as Token).photo}')),
              ),
            ),

            //GIVE SOME SPACE
            SizedBox(width: 10),

            //THE SYMBOL/NAME DISPLAY
            Column(
              children: [
                Text('TST',style: TextStyle(
                color: Color.fromARGB(255, 38, 69, 141),
                fontWeight: FontWeight.bold,
                fontSize: 16
                )),
                Text('${(widget.asset as Token).name}',style: TextStyle(
                  color: Color.fromARGB(255, 231, 233, 237),
                  fontWeight: FontWeight.bold,
                  fontSize: 13
                ))
              ],
            )
          ],
        ),

        //THE PRICE
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text('${(widget.asset as Token).quantity}    ',style: TextStyle(
                color: Color.fromARGB(255, 38, 69, 141),
                fontWeight: FontWeight.bold,
                fontSize: 16
                )),
              Text('${(widget.asset as Token).price}€',style: TextStyle(
                  color: Color.fromARGB(255, 231, 233, 237),
                  fontWeight: FontWeight.bold,
                  fontSize: 13
                )),
            ],
          ),
        )

        ],
      );
    }
  }
}