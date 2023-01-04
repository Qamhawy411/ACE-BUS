import 'package:bus_booking/Shared/shared_Screen/allTickets.dart';
import 'package:bus_booking/Shared/shared_Screen/trip_offerScreen.dart';
import 'package:bus_booking/Shared/shared_widget/text_field.dart';
import 'package:bus_booking/Trips/tickets/ticket_controller.dart';
import 'package:bus_booking/Trips/tickets/ticket_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  TextEditingController Destinationcontroller = TextEditingController();
  TextEditingController Destinationcontroller2 = TextEditingController();
  GlobalKey<FormState> _form = GlobalKey<FormState>();
  GlobalKey<FormState> _form1 = GlobalKey<FormState>();
  GlobalKey<FormState> _form2 = GlobalKey<FormState>();
  DateTime? selectedDate = DateTime.now();
  DateTime? selectedDate2 = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TicketController, TicketStates>(
      builder: (context, state) => Scaffold(
        body: Form(
          key: _form,
          child: ListView(
            children: [
              Container(
                height: 850,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      height: 180,
                      width: 500,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                        image: DecorationImage(
                            image: AssetImage("assets/back.jpg"),
                            fit: BoxFit.fill),
                      ),
                      child:
                          Container(color: Colors.blue[100]!.withOpacity(.50)),
                    ),
                    Positioned(
                        top: 70,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "ACeBus",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w800),
                            ),
                            Text("  Find Cheap bus ticket",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold))
                          ],
                        )),
                    Positioned(
                        top: 60,
                        right: 5,
                        child: Container(
                          width: 70,
                          height: 80,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "https://tse4.mm.bing.net/th?id=OIP.74Z2wI0FmMghhajXOEw_bgHaJF&pid=Api&P=0"))),
                        )),
                    Positioned(
                        top: 150,
                        left: 20,
                        child: Container(
                          width: 350,
                          height: 450,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.grey[350]),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                          text: "One_way",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w900),
                                          children: [
                                            TextSpan(
                                              text: "   Round Trip",
                                              style: TextStyle(
                                                  color: Colors.orange,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w900),
                                            )
                                          ]),
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.person,
                                        ),
                                        Text("4")
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              ReadyFormField(Readyfield(
                                validateFun: (p0) {
                                  if (p0!.isEmpty) {
                                    return "This field required";
                                  }
                                },
                                key: _form1,
                                controller: Destinationcontroller,
                                hintText: "Enter your Location",
                                prefix: Icon(Icons.location_on),
                              )),
                              ReadyFormField(Readyfield(
                                key: _form2,
                                validateFun: (p0) {
                                  if (p0!.isEmpty) {
                                    return "This field required";
                                  }
                                },
                                controller: Destinationcontroller2,
                                hintText: "Enter your Destination",
                                prefix: Icon(Icons.pin_drop),
                              )),
                              // ReadyFormField(Readyfield(

                              //   prefix: Row(
                              //     children: [
                              //       IconButton(
                              //           onPressed: () async {
                              //             try {
                              //               selectedDate2 =
                              //                   await showDatePicker(
                              //                       context: context,
                              //                       initialDate: DateTime.now(),
                              //                       firstDate: DateTime.now(),
                              //                       lastDate: DateTime(2030));
                              //               setState(() {
                              //                 selectedDate2 = selectedDate2;
                              //               });
                              //             } catch (e) {

                              //               selectedDate2 = DateTime.now();
                              //             }
                              //           },
                              //           icon: Icon(Icons.calendar_month)),
                              //       Text(
                              //           "${selectedDate2.toString().substring(0, 10)}"),
                              //       Text(
                              //         "   |  + Add Travel Date  ",
                              //         style: TextStyle(
                              //             color: Colors.grey, fontSize: 18),
                              //       )
                              //     ],
                              //   ),
                              // )),
                              // ReadyFormField(Readyfield(
                              //     prefix: Row(
                              //       children: [
                              //         IconButton(
                              //             onPressed: () async {
                              //               try {
                              //                 selectedDate =
                              //                     await showDatePicker(
                              //                         context: context,
                              //                         initialDate:
                              //                             DateTime.now(),
                              //                         firstDate: DateTime.now(),
                              //                         lastDate: DateTime(2030));
                              //                 setState(() {
                              //                   selectedDate = selectedDate;
                              //                 });
                              //               } catch (e) {
                              //                 selectedDate = DateTime.now();
                              //               }
                              //             },
                              //             icon: Icon(Icons.calendar_month)),
                              //         Text(
                              //             "${selectedDate.toString().substring(0, 10)}"),
                              //         Text(
                              //           "     |  + add return  ",
                              //           style: TextStyle(
                              //               color: Colors.grey, fontSize: 20),
                              //         )
                              //       ],
                              //     ))),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 8),
                                child: Container(
                                  width: 350,
                                  height: 60,
                                  decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      border: Border.all(color: Colors.blue),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Row(
                                    children: [
                                      IconButton(
                                          onPressed: () async {
                                            try {
                                              selectedDate =
                                                  await showDatePicker(
                                                      context: context,
                                                      initialDate:
                                                          DateTime.now(),
                                                      firstDate: DateTime.now(),
                                                      lastDate: DateTime(2030));
                                              setState(() {
                                                selectedDate = selectedDate;
                                              });
                                            } catch (e) {
                                              selectedDate = DateTime.now();
                                            }
                                          },
                                          icon: Icon(Icons.calendar_month)),
                                      Text(
                                          "${selectedDate.toString().substring(0, 10)}"),
                                      Text(
                                        "     |  + add travel  ",
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 20),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 8),
                                child: Container(
                                  width: 350,
                                  height: 63,
                                  decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      border: Border.all(color: Colors.blue),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Row(
                                    children: [
                                      IconButton(
                                          onPressed: () async {
                                            try {
                                              selectedDate2 =
                                                  await showDatePicker(
                                                      context: context,
                                                      initialDate:
                                                          DateTime.now(),
                                                      firstDate: DateTime.now(),
                                                      lastDate: DateTime(2030));
                                              setState(() {
                                                selectedDate2 = selectedDate;
                                              });
                                            } catch (e) {
                                              selectedDate = DateTime.now();
                                            }
                                          },
                                          icon: Icon(Icons.calendar_month)),
                                      Text(
                                          "${selectedDate.toString().substring(0, 10)}"),
                                      Text(
                                        "     |  + add return  ",
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 20),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              TextButton(
                                  onPressed: () {
                                    if (!_form.currentState!.validate()) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content: Text(
                                                  "Some Fields Reqyired")));
                                    } else {
                                      BlocProvider.of<TicketController>(context)
                                          .Searching(
                                        Destinationcontroller.text,Destinationcontroller2.text
                                      );
                                      Navigator.of(context).push(
                                          MaterialPageRoute(builder: (context) {
                                        return tripOfffers_screen();
                                      }));
                                    }
                                  },
                                  child: Container(
                                    child: Center(
                                      child: Text(
                                        "Search",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    width: 400,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: Color(0xff070E2B),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                  ))
                            ],
                          ),
                        )),
                    Positioned(
                      top: 615,
                      left: 10,
                      child: RichText(
                        text: TextSpan(
                            text: "  Cheap Bus Ticket \n ",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w900),
                            children: [
                              TextSpan(
                                text: "   from manchester to paris ",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w900),
                              )
                            ]),
                      ),
                    ),
                    Positioned(
                        top: 665,
                        left: 45,
                        child: Container(
                            width: 310,
                            height: 180,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        "Cheapst  ",
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w900),
                                      ),
                                      Text(
                                        "Average",
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w900),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(12, 5, 12, 5),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        "  125\$  ",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w900),
                                      ),
                                      Text(
                                        "146\$",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w900),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) {
                                              return AllTickets();
                                            }));
                                          },
                                          child: Container(
                                            width: 100,
                                            height: 35,
                                            decoration: BoxDecoration(
                                                color: Colors.black12,
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Center(
                                                child: Text("find Ticket")),
                                          )),
                                      Text(
                                        "Find Acheap fare by \n book as far in advance ",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w900),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            )))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
