// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:localstorage/localstorage.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //SOME INIT STATES
  final LocalStorage storage = LocalStorage('cefi_app');
  final  formKey = GlobalKey<FormState>();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // REFER VALUES
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
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
      // CHILD COLUMN WIDGET FOR DISPLAY THE WIDGETS IN AN WIDGET TREE
      child: Column(
        // ARRAY OF WIDGETS (CHILDREN)
        children: <Widget>[
        //DISPLAY THE LOGO FOR THE APP
        SafeArea(child: Center(heightFactor: 2.5,child: Image(image: AssetImage('assets/chunksup.png')))),
        // JUST AN SIZED BOX TO GIVE SOME SPACE
        SizedBox(height: height*0.005),
        // WELCOME TEXT
        Text('Welcome to',style: TextStyle(fontWeight: FontWeight.bold,fontSize: (height*width)*0.000075),),
         // JUST AN SIZED BOX TO GIVE SOME SPACE
        SizedBox(height: height*0.005,),
        // TEXT IMAGE
        Image(image: AssetImage('assets/chunks.png')),
        SizedBox(height: 20),
        //JUST AN DESCRIPTION
        Text('Login',style: TextStyle(fontWeight: FontWeight.bold,fontSize: (height*width)*0.000075),),
        // FORM TO AN FORM TYPE WIDGETS
        Form(
          key: formKey,
          // SOME PADDING
          child: Padding(
            padding: EdgeInsets.fromLTRB(width*0.10, 0, width*0.10, 0),
            // AN COLUMN
            child: Column(
              children: <Widget>[
                // EMAIL TEXTFORM FIELD
                //TEXT FORM FIELDS
                  Container(
                    child: TextFormField(
                      validator: (value){
                        //CHECK THE LENGTH
                      if(value!.length < 4){
                      return 'Its not valid';
                      }else{
                        return null;
                      }
                      },
                      controller: username,
                      cursorColor: Colors.black,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color.fromARGB(255, 57, 133, 50))
                      ),
                      labelText: 'Username',
                      labelStyle: TextStyle(
                      color: Color.fromARGB(255, 106, 106, 106),
                      fontSize: 17
                      )
                      ),
                    ),
                  ), 
                // JUST AN SIZED BOX TO GIVE SOME SPACE
                SizedBox(height: height*0.07),
                //TEXT FORM FIELDS
                  TextFormField(
                    controller: password,
                    validator: (value){
                      //CHECK THE LENGTH
                    if(value!.length < 4){
                    return 'Please write something down';
                    }else{
                      return null;
                    }
                    },
                    cursorColor: Colors.black,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color.fromARGB(255, 57, 133, 50))
                    ),
                    labelText: 'Password',
                    labelStyle: TextStyle(
                    color: Color.fromARGB(255, 106, 106, 106),
                    fontSize: 17
                    )
                    ),
                  ), 
                // JUST AN SIZED BOX TO GIVE SOME SPACE
                SizedBox(height: height*0.07),
                // AN ROW TO DISPLAY 2 BUTTONS
                Row(
                  // MAKE SPACE BEETWEEN THEM
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    // TEXT BUTTON WITH ICON
                    TextButton.icon(style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 79, 153, 81))),
                    onPressed:  ()async{
                      //CHECK IF IT IS VALID
                      final isValid = formKey.currentState!.validate();
                      if(isValid){
                      print('all good');
                      }else{
                        print('error');
                      }
                      //CREATE AN URL
                      var url = Uri.parse('http://10.0.2.2:3000/authenticate');
                      //THE RESPONSE
                      var response = await http.post(url,body: {'username':username.text,'password':password.text});
                      //IF IT IS SUCESSFULL
                      if(response.statusCode==200){
                        //GET DATA
                      var data = json.decode(response.body);
                      //STORAGE THE DATA
                      storage.setItem('token', data['token']);
                      //GET THE DATA
                      // ignore: use_build_context_synchronously
                      Navigator.pop(context);
                      // ignore: use_build_context_synchronously
                      Navigator.pushNamed(context, '/home');
                      }else{
                      AlertDialog(title: Text('Password incorrect'));
                      }
                      

                    }, 
                    icon: Icon(Icons.login,size: (width*height)*0.00015,color: Colors.black,), label: Text('Login',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: (width*height)*0.00007))),
                    // TEXT BUTTON WITH ICON
                    TextButton.icon(style:ButtonStyle(backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 33, 76, 116))),onPressed: ()async{//BRING THE LOADING
                    Navigator.pushNamed(context, '/loading');
                    //MAKE THE APP AWAIT
                    await Future.delayed(Duration(seconds: 5));  
                    //GO TO LOGIN
                    // ignore: use_build_context_synchronously
                    Navigator.pushNamed(context, '/register');}, icon: Icon(Icons.app_registration_sharp,size: (width*height)*0.00015,color: Colors.black,),label: Text('Register',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: (width*height)*0.00007)))
                  ],
                )
          
              ],
            ),
          )
        )

        ],
      ),
    ),
    );
  }
}