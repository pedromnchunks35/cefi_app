// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

// Registertwo WIDGET
class Registertwo extends StatefulWidget {
  const Registertwo({Key? key}) : super(key: key);

  @override
  State<Registertwo> createState() => _RegistertwoState();
}

class _RegistertwoState extends State<Registertwo> {
  @override
  Widget build(BuildContext context) {
    // REFER VALUES
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    //THE RETURN FROM THE BUILDING FUNCTION
    return Scaffold(
      resizeToAvoidBottomInset: false,
    //Body Property
          //CONTAINER
    body: Container(
      //DECORATION PROPERTY
      decoration: BoxDecoration(
        //MAKE THE GRADIENT
        gradient: LinearGradient(
          //COLORS USED
          // ignore: prefer_const_literals_to_create_immutables
          colors: [
            Color.fromARGB(255, 255, 255, 255),
              Color.fromARGB(255, 133, 129, 129),
          ]
        )
      ),
      //THE CHILD
           //AN COLUMN TO DISPLAY MULTIPLE WIDGETS (WHICH IS INSIDE AN SAFE AREA TO BE DOWN THE BAR)
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        //THE CHILDREN OF TYPE WIDGET
        // ignore: prefer_const_literals_to_create_immutables
        children: <Widget>[
        //CENTER WIDGET TO CENTER THE LOGO
        SafeArea(
          child: Center(
            heightFactor: 1,
            //AN CHILD WHICH GIVES BIRTH TO AN IMAGE OF TYPE ASSET IMAGE
            child: Image(image: AssetImage('assets/chunksup.png',),width: width*0.2,height: height*0.2) ,
          ),
        ),
        //AN FORM
        Form(
          //AN CONTAINER
          child: Container(
            //APPLY MARGIN
            margin: EdgeInsets.fromLTRB(width*0.10, 0,width*0.10,0),
            //COLUMN FOR THE TEXT FORM FIELDS
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(height: height*0.02),   
                  //TEXT FORM FIELDS
                  TextField(
                    cursorColor: Colors.black,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color.fromARGB(255, 57, 133, 50))
                    ),
                    labelText: 'Enter your phone number',
                    labelStyle: TextStyle(
                    color: Color.fromARGB(255, 106, 106, 106),
                    fontSize: 17
                    )
                    ),
                  ), 
                      
                  SizedBox(height: height*0.03),
                  //TEXT FORM FIELDS
                  TextField(
                    cursorColor: Colors.black,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color.fromARGB(255, 57, 133, 50))
                    ),
                    labelText: 'Enter your post code',
                    labelStyle: TextStyle(
                    color: Color.fromARGB(255, 106, 106, 106),
                    fontSize: 17
                    )
                    ),
                  ), 
                      
                  SizedBox(height: height*0.03),
            
                  //TEXT FORM FIELDS
                  TextField(
                    cursorColor: Colors.black,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color.fromARGB(255, 57, 133, 50))
                    ),
                    labelText: 'Enter your city',
                    labelStyle: TextStyle(
                    color: Color.fromARGB(255, 106, 106, 106),
                    fontSize: 17
                    )
                    ),
                  ), 
                  SizedBox(height: height*0.07),
            
                  
                //AN ROW
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //TEXT BUTTON WITH AN ICON
                    TextButton.icon(
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 33, 76, 116))),
                    onPressed: ()async{
                    //LOADING
                    Navigator.pushNamed(context,'/loading');
                    //AN DELAY
                    await Future.delayed(Duration(seconds: 5));
                    //GO TO REGISTER
                    // ignore: use_build_context_synchronously
                    Navigator.pushNamed(context,'/register');
                    }, icon: Icon(Icons.app_registration_rounded,color: Colors.black,size: (width*height)*0.00015,),
                    label: Text('Back',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: (width*height)*0.00007),),
                    ),
                    //TEXT BUTTON WITH AN ICON
                    TextButton.icon(
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 79, 153, 81))),
                    onPressed: ()async{
                    //BRING THE LOADING
                    Navigator.pushNamed(context, '/loading');
                    //MAKE THE APP AWAIT
                    await Future.delayed(Duration(seconds: 5));  
                    //GO TO LOGIN
                    // ignore: use_build_context_synchronously
                    Navigator.pushNamed(context, '/login');
                    }, icon: Icon(Icons.login_sharp,color: Colors.black,size:(width*height)*0.00015,),
                    label: Text('Submit',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: (width*height)*0.00007),),
                    ),
                  ],
                ),
                
            
                ],
              ),
            ),
          ),
        )
        ],
      ),
    ),
    );
  }
}