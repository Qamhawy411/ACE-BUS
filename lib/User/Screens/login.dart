import 'package:bus_booking/Shared/Navigation/navigation_Screen.dart';
import 'package:bus_booking/Shared/shared_widget/text_field.dart';
import 'package:bus_booking/User/Screens/signout.dart';
import 'package:flutter/material.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  GlobalKey<FormState> _form = GlobalKey<FormState>();
  GlobalKey<FormState> emailkey = GlobalKey<FormState>();
  GlobalKey<FormState> passkey = GlobalKey<FormState>();
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
          body: Form(
            key: _form,
            child: ListView(
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
                  " Welcome Back",
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
                          validateFun: (p0) {
                            if (p0!.isEmpty) {
                              return "this field is required";
                            }
                          },
                          border: false,
                          key: emailkey,
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
                          validateFun: (p0) {
                            if (p0!.length<3) {
                              return "this field is required";
                            }
                          },
                          key: passkey,
                          border: false,
                          secure: Secure.password,
                          hintText: "Enter Password",
                          prefix: Icon(Icons.lock),
                          isSecure: true))),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    child: Text(
                      "Forget Password?   ",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 7),
                  child: TextButton(
                      onPressed: () {
                        if (!_form.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Some Fields Reqyired")));
                        }else{Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){ return navigationScreen(); }));}
                      },
                      child: Container(
                        width: 400,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.lime,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            "LOGIN",
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
                    child: InkWell(
                      onTap: (() {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return SignOut();
                        }));
                      }),
                      child: Text(
                        "Dont Have an Account / SignUp ",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
