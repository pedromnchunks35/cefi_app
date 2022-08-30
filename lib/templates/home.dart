// ignore_for_file: prefer_const_constructors

import 'package:bottom_bar/bottom_bar.dart';
import 'package:cefi_app/templates/homewidget.dart';
import 'package:cefi_app/templates/market.dart';
import 'package:cefi_app/templates/modules/session.dart';
import 'package:cefi_app/templates/wallet.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //PAGE CONTROLLERS
  int _currentPage = 1;
  final _pageController = PageController();
  @override

  @override
  Widget build(BuildContext context) {
    
    //RETURN AN SCAFFOLD
     return Scaffold(
      //RETURN AN PAGE VIEW IN THE BODY
      body: PageView(
        //THE PAGE CONTROLLER
        controller: _pageController,
        //WIDGETS BY INDEX
        children: [
          Market(),
          HomeWidget(session: Session(public_address: 'Pedro',session_id: 'Hello')),
          Wallet()
        ],
        //WHAT APPENS WHEN WE CHANGE THE PAGE
        onPageChanged: (index) {
          setState(() => _currentPage = index);
        },
      ),
      //THE NAVIGATION BAR
      bottomNavigationBar: BottomBar(
        //THE TEXT OF THE NAVIGATION BAR
        // ignore: prefer_const_constructors
        textStyle: TextStyle(fontWeight: FontWeight.bold),
        //THE INDEX
        selectedIndex: _currentPage,
        //WHAT APPENS WHEN WE TAP ON THE ICONS
        onTap: (int index) {
          _pageController.jumpToPage(index);
          setState(() => _currentPage = index);
        },
        //THE ITEMS OF THE BAR
        items: <BottomBarItem>[
          //MARKET BAR
          BottomBarItem(
            icon: Icon(Icons.sell),
            activeColor: Colors.blue,
            activeTitleColor: Colors.blue.shade600,
          ),
          BottomBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
            activeColor: Colors.red,
          ),
          BottomBarItem(
            icon: Icon(Icons.wallet),
            title: Text('Wallet'),
            backgroundColorOpacity: 0.1,
            activeColor: Colors.greenAccent.shade700,
          ),
        ],
      ),
    );
  }
  }