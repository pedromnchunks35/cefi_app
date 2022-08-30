// ignore_for_file: prefer_const_constructors

import 'package:cefi_app/templates/modules/session.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:localstorage/localstorage.dart';

class HomeWidget extends StatefulWidget {
  
  const HomeWidget({Key? key,required this.session}) : super(key: key);
 
 final Session session;

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  final LocalStorage storage = LocalStorage('cefi_app');
  @override
  Widget build(BuildContext context) {
    //RETURN AN CONTAINER
    return Container(
      //SOME COLOR IN IT
      color: Colors.white,
      //CONTAINER CHILD
      child: Column(children: <Widget>[
        //SOME PADDING OVER THE IMAGE
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: SafeArea(child: Image(image: AssetImage('assets/chunksup.png'))),
        ),
        //AN SIZED BOX
        SizedBox(height: 20),

        
        Text('Welcome to'),
        Image(image: AssetImage('assets/chunks.png')),
        SizedBox(height: 15,),
        Text('Please trade and buy wisely',style: TextStyle(fontWeight: FontWeight.bold),),
        SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
          child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          color: Color.fromARGB(255, 38, 69, 141),
          elevation: 10,
          child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: <Widget>[


          ListTile(
            leading: Icon(Icons.person,size: 50,),
            title: Text('Name',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20)),
            subtitle: Text('Pedro',style: TextStyle(color: Color.fromARGB(255, 195, 181, 181),fontWeight: FontWeight.bold),),
          ),



          ListTile(
            leading: Icon(Icons.account_balance,size: 50),
            title: Text('Public Address',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
            subtitle: Text('AX0121312313441321312',style: TextStyle(color: Color.fromARGB(255, 195, 181, 181),fontWeight: FontWeight.bold)),
          ),


          ListTile(
            leading: Icon(Icons.verified_user,size: 50),
            title: Text('Username',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
            subtitle: Text('AX0121312313441321312',style: TextStyle(color: Color.fromARGB(255, 195, 181, 181),fontWeight: FontWeight.bold)),
          )


          ],),
          ),
        ),
        SizedBox(height: 40),
        Image(image: AssetImage('assets/giphy.gif'),width: 100,height: 100),
      ],)
    );
  }
}