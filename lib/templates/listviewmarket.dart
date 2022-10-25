// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'modules/nft.dart';
import 'modules/token.dart';

class ListViewMarket extends StatefulWidget {
  ListViewMarket({Key? key,required this.asset}) : super(key: key);
  Map<String,dynamic> asset;
  @override
  State<ListViewMarket> createState() => _ListViewMarketState();
}

class _ListViewMarketState extends State<ListViewMarket> {

@override
void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
     //CHECK THE TYPE OF THE ASSET
    if(widget.asset['type_sell'] == "nft"){
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
                image: DecorationImage(image: NetworkImage(widget.asset['url'])),
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
                ),),
                Text('${widget.asset['description']}',style: TextStyle(
                  color: Color.fromARGB(255, 231, 233, 237),
                  fontWeight: FontWeight.bold,
                  fontSize: 13
                ),)
              ],
            ),
          ],
        ),


        //THE SECOUND CONTAINER WHICH WILL DISPLAY THE PRICE OF THE NFT
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: Text('${widget.asset['price']} CHK',style: TextStyle(
                  color: Color.fromARGB(255, 231, 233, 237),
                  fontWeight: FontWeight.bold,
                  fontSize: 13
                )),
         ),

         Padding(
           padding: const EdgeInsets.all(8.0),
           child: TextButton(onPressed: (){}, child: Text('Buy',style: TextStyle(
                  color: Color.fromARGB(255, 38, 69, 141),
                  fontWeight: FontWeight.bold,
                  fontSize: 16
                  ))
                  ,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 232, 231, 234))                ),),
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
        ),
        //BUTTONS , BUY AND SELL
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              TextButton(onPressed: (){}, child: Text('Buy',style: TextStyle(
                  color: Color.fromARGB(255, 38, 69, 141),
                  fontWeight: FontWeight.bold,
                  fontSize: 16
                  )),style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 232, 231, 234))                )),
              SizedBox(width: 10),
              TextButton(onPressed: (){}, child: Text('Sell',style: TextStyle(
                  color: Color.fromARGB(255, 38, 69, 141),
                  fontWeight: FontWeight.bold,
                  fontSize: 16
                  )),style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 232, 231, 234))                )),
            ],
          ),
        ),
        

        ],
      );
    }
  }
  }
