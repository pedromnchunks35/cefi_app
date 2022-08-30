// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

// REGISTER WIDGET
class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
                    labelText: 'Enter your name',
                    labelStyle: TextStyle(
                    color: Color.fromARGB(255, 106, 106, 106),
                    fontSize: 17
                    )
                    ),
                  ), 
                      
                  SizedBox(height: height*0.01),
                  //TEXT FORM FIELDS
                  TextField(
                    cursorColor: Colors.black,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color.fromARGB(255, 57, 133, 50))
                    ),
                    labelText: 'Enter your username',
                    labelStyle: TextStyle(
                    color: Color.fromARGB(255, 106, 106, 106),
                    fontSize: 17
                    )
                    ),
                  ), 
                      
                  SizedBox(height: height*0.01),
            
                  //TEXT FORM FIELDS
                  TextField(
                    cursorColor: Colors.black,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color.fromARGB(255, 57, 133, 50))
                    ),
                    labelText: 'Enter your email',
                    labelStyle: TextStyle(
                    color: Color.fromARGB(255, 106, 106, 106),
                    fontSize: 17
                    )
                    ),
                  ), 
                  SizedBox(height: height*0.01),
            
                  //TEXT FORM FIELDS
                  TextField(
                    obscureText: true,
                    cursorColor: Colors.black,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color.fromARGB(255, 57, 133, 50))
                    ),
                    labelText: 'Enter your password',
                    labelStyle: TextStyle(
                    color: Color.fromARGB(255, 106, 106, 106),
                    fontSize: 17
                    )
                    ),
                  ),
                SizedBox(height: height*0.10,),
                //AN ROW
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //TEXT BUTTON WITH AN ICON
                    TextButton.icon(
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 79, 153, 81))),
                    onPressed: ()async{
                    
                    //BRING THE LOADING
                    Navigator.pushNamed(context, '/loading');
                    //MAKE THE APP AWAIT
                    await Future.delayed(Duration(seconds: 5));  
                    //GO TO SECOUND PARTE OF THE REGISTER
                    // ignore: use_build_context_synchronously
                    Navigator.pushNamed(context, '/registertwo');

                    }, icon: Icon(Icons.app_registration_rounded,color: Colors.black,size: (width*height)*0.00015,),
                    label: Text('Next',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: (width*height)*0.00007),),
                    ),
                    //TEXT BUTTON WITH AN ICON
                    TextButton.icon(
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 33, 76, 116))),
                    onPressed: ()async{
                    //BRING THE LOADING
                    Navigator.pushNamed(context, '/loading');
                    //MAKE THE APP AWAIT
                    await Future.delayed(Duration(seconds: 5));  
                    //GO TO LOGIN
                    // ignore: use_build_context_synchronously
                    Navigator.pushNamed(context, '/login');
                    }, icon: Icon(Icons.login_sharp,color: Colors.black,size: (width*height)*0.00015,),
                    label: Text('Login',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: (width*height)*0.00007),),
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