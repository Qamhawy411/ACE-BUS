import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SharedFonts{

 static const TextStyle blackFont20 = TextStyle(color:Colors.black,fontSize: 20,fontWeight: FontWeight.w900 ); 
   static const TextStyle blackFont25 = TextStyle(color:Colors.black,fontSize: 25,fontWeight: FontWeight.w900 );
   static const TextStyle orangeFont20 = TextStyle(color:Colors.orange,fontSize: 20,fontWeight: FontWeight.w900 );
   static const TextStyle orangeFont25 = TextStyle(color:Colors.orange,fontSize: 25,fontWeight: FontWeight.w900 );
}

// Container(
//                         padding: EdgeInsets.all(10),
//                         child: SingleChildScrollView(
//                           physics: BouncingScrollPhysics(),
//                           child: Column(
//                             children: [
//                               Padding(
//                                 padding: const EdgeInsets.all(10.0),
//                                 child: Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     texty("FlxiBus", Colors.indigo, 20),
//                                     texty("Cheapst", Colors.blue, 20),
//                                     texty("FlxiBus", Colors.pink, 20),
//                                   ],
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     texty("1:40 pm", Colors.black, 20),
//                                     Expanded(
//                                         child: Divider(
//                                       color: Colors.black,
//                                       thickness: 2,
//                                     )),
//                                     Container(
//                                       child: texty(
//                                           "    7h 20 m    ", Colors.black, 20),
//                                       decoration: BoxDecoration(
//                                           color: Colors.amber[200],
//                                           borderRadius:
//                                               BorderRadius.circular(20)),
//                                     ),
//                                     Expanded(
//                                         child: Divider(
//                                       color: Colors.black,
//                                       thickness: 2,
//                                     )),
//                                     texty("7:40 pm", Colors.black, 20),
//                                   ],
//                                 ),
//                               ),
//                               Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   RichText(
//                                       text: TextSpan(
//                                           text: "Manchester\n",
//                                           style: TextStyle(
//                                               color: Colors.blue,
//                                               fontSize: 20,
//                                               fontWeight: FontWeight.w900),
//                                           children: [
//                                         TextSpan(
//                                           text: "metroElqraea",
//                                           style: TextStyle(
//                                               color: Colors.grey[400]),
//                                         )
//                                       ])),
//                                   texty("     Paris  \n  metroElqraea ",
//                                       Colors.black, 20),
//                                 ],
//                               ),

//                                Column(
//                                 children: [
//                                   Container(
//                                     width: 100,
//                                     height: 30,
//                                     color: Colors.blue[100],
                                   
//                                   )
//                                 ],

//                                )
//                             ],
//                           ),
//                         ),
//                         height: 190,
//                         width: 50,
//                         decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(10),
//                             border: Border.all(color: Colors.blue, width: 1)),
//                       ),