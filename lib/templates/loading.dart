// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}
                                                //IMPORT TICKERPROVIDER FOR VSYNC
class _LoadingState extends State<Loading> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
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
      //COLUMN
      child: Column(
        //CENTER IT
        mainAxisAlignment: MainAxisAlignment.center,
        // ignore: prefer_const_literals_to_create_immutables
        children: <Widget>[
          //TWEEN ANIMATION BUILDER
         TweenAnimationBuilder(
          //THE INIT VALUES
          tween: Tween<double>(begin: 0,end: 1),
          //THE IMAGE
          child: Image(image: AssetImage('assets/chunksup.png')),
          //THE DURATION
         duration: Duration(seconds: 5), 
         //THE BUILDER
         // ignore: no_leading_underscores_for_local_identifiers
         builder: ((BuildContext context, double _val,child){
          //RETURN AN WIDGET
         return Opacity(opacity: _val,child: child);
         })),
        //STARTING AN ROTATION TRANSITION
         RotationTransition(
          //TURNS PROPERTY WHICH IS A CURVED ANIMATION
          turns: CurvedAnimation(
          //THE PARENT OF THIS ANIMATION , WHICH WILL CONTROLL THE STATE OF THE OBJECT
          parent: AnimationController(vsync: this,duration: Duration(seconds: 5))..repeat(reverse: true), 
          //TYPE OF THE CURVE
          curve: Curves.elasticOut
          ),
          //THE CHILD OF THIS OBJECT WHICH WILL BE THE CHUNKS PNG
          
          child: Image(image: AssetImage('assets/chunks.png')), 
         ),
         

        ],
        
       
      ),
    );
  }
}