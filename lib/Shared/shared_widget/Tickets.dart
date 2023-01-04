import 'package:bus_booking/Trips/tickets/ticket_controller.dart';
import 'package:bus_booking/Trips/tickets/ticket_model.dart';
import 'package:bus_booking/Trips/tickets/ticket_states.dart';
import 'package:bus_booking/Trips/trip_screens/trip_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Tickets extends StatefulWidget {
  bool isDetails = false;
  TicketModel? Ticket;
  Tickets(this.Ticket, {required this.isDetails, super.key});

  @override
  State<Tickets> createState() => _TicketsState();
}

class _TicketsState extends State<Tickets> {
  bool isBooked = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          !widget.isDetails
              ? Navigator.of(context).push(
                  MaterialPageRoute(builder: ((context) => TicketDetail(widget.Ticket!))))
              : {};
        },
        child: Card(
          margin: EdgeInsets.all(10),
          color: Colors.amber[100],
          shape: !widget.isDetails
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    width: 2,
                  ))
              : Border(),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        texty(widget.Ticket!.companyName, Colors.indigo, 20),
                        texty(widget.Ticket!.salaryCase, Colors.blue, 25),
                        texty("${widget.Ticket!.ticketSalary}\$", Colors.pink, 20),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                           decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              color: Colors.amber[200],
                              borderRadius: BorderRadius.circular(20)),
                          child: texty(widget.Ticket!.moveTime.toString(), Colors.black,
                              20),
                        ),
                        Expanded(
                            child: Divider(
                          color: Colors.black,
                          thickness: 2,
                        )),
                        Container(
                          child: texty(
                             "  ${ widget.Ticket!.arriveTime -
                                    widget.Ticket!.moveTime} Hour  " ,
                              Colors.black,
                              20),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                              color: Colors.amber[200],
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        Expanded(
                            child: Divider(
                          color: Colors.black,
                          thickness: 2,
                        )),
                        Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              color: Colors.amber[200],
                              borderRadius: BorderRadius.circular(20)),
                          child: texty(widget.Ticket!.arriveTime.toString(),
                              Colors.black, 20),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                          text: TextSpan(
                              text: "${widget.Ticket!.movePlace1} \n",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w900),
                              children: [
                            TextSpan(
                              text: "${widget.Ticket!.busMoveplace}",
                              style: TextStyle(color: Colors.grey[400]),
                            )
                          ])),
                      texty(
                          "    ${widget.Ticket!.arrivePlace1}  \n  ${widget.Ticket!.busarriveplace} ",
                          Colors.black,
                          20),
                    ],
                  ),
                  widget.isDetails
                      ? ExpansionTile(
                          title: Text("Details"),
                          children: [
                            Container(
                              height: 100,
                              decoration: BoxDecoration(
                                  color: Colors.black45,
                                  borderRadius: BorderRadius.circular(20)),
                            )
                          ],
                        )
                      : SizedBox(),
                  widget.isDetails
                      ? ExpansionTile(
                          title: Text("Transfer"),
                          children: [
                            Container(
                              height: 100,
                              decoration: BoxDecoration(
                                  color: Colors.black45,
                                  borderRadius: BorderRadius.circular(20)),
                            )
                          ],
                        )
                      : SizedBox(),
                  widget.isDetails
                      ? InkWell(
                          onTap: (() {
                            BlocProvider.of<TicketController>(context).handelAddandRemove(widget.Ticket!);
                          }),
                          child: Container(
                            width: 160,
                            height: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.lime),
                            child: Center(
                              child: Text(
                               widget.Ticket!.isBooked? "Booked":"Booking Now"
                                ,style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w900),
                              ),
                            ),
                          ),
                        )
                      : SizedBox()
                ],
              ),
            ),
          ),
        ));
  }

  Text texty(String texty, Color colour, double size) {
    return Text(
      texty,
      style:
          TextStyle(color: colour, fontSize: size, fontWeight: FontWeight.w900),
    );
  }
}
