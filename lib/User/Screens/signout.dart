import 'package:bus_booking/Shared/shared_widget/text_field.dart';
import 'package:flutter/material.dart';

class SignOut extends StatefulWidget {
  const SignOut({super.key});

  @override
  State<SignOut> createState() => _SignOutState();
}

class _SignOutState extends State<SignOut> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/bus.png"), fit: BoxFit.cover)),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 50, 0, 5),
                child: Center(
                    child: Text(
                  "ACe Bus",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.w900),
                )),
              ),
              Center(
                  child: Text(
                "Booking Your Ticket",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w900),
              )),
               Center(
                  child: Text(
                " Welcome To Sign Up",
                style: TextStyle(
                    color: Colors.lime[900],
                    fontSize: 30,
                    fontWeight: FontWeight.w900),
              )),
              SizedBox(
                height: 285,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.lime,
                        borderRadius: BorderRadius.circular(20)),
                    child: ReadyFormField(Readyfield(
                        border: false,
                        hintText: "Enter Email",
                        prefix: Icon(Icons.mail)))),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.lime,
                        borderRadius: BorderRadius.circular(20)),
                    child: ReadyFormField(Readyfield(
                        border: false,
                        secure: Secure.password,
                        hintText: "Enter Password",
                        prefix: Icon(Icons.lock),
                        isSecure: true))),
              ),
             
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 7),
                child: TextButton(
                    onPressed: () {},
                    child: Container(
                      width: 400,
                      height: 50,
                     decoration: BoxDecoration( color: Colors.lime,borderRadius: BorderRadius.circular(20),),
                     child: Center(
                       child: Text(
                        "SignUp",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                    ),
                     ), 
                    )),
              ),
                   Align(
                alignment: Alignment.center,
                  child: InkWell(
                    onTap: (() {
                      Navigator.of(context).pop();
                    }),
                    child: Text(
                      "Already Have an Account / SignIN ",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              
            ],
          ),
        )
      ],
    );
  }
}
