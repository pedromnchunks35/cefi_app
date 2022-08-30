
import 'package:cefi_app/templates/home.dart';
import 'package:cefi_app/templates/login.dart';
import 'package:cefi_app/templates/registertwo.dart';
import 'package:flutter/material.dart';
import './templates/register.dart';
import './templates/loading.dart';
//RUN FUNCTION TO START THE WHOLE APP
void main() {
  //THE RUN METHOD
  runApp(
  //THE RESPONSIBLE WIDGET FOR THE ROOTS
  MaterialApp(
  //SET THE TITLE
  title: 'CHUNKS CEFI',
  //THE INITIAL ROUTE
  initialRoute: '/login',
  //THE ROUTES
  routes: 
  {
  // '/': ,
  '/login': (context) => Login(),
  // ignore: prefer_const_constructors
  '/register': (context)=>Register(),
  // '/wallet': ,
  // '/market': ,
  '/home': (context)=> Home(),
  '/loading': (context)=>Loading(),
  '/registertwo': (context)=>Registertwo()
  },
  
  ));

}

