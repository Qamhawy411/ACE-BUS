import 'package:bus_booking/Shared/shared_widget/Tickets.dart';
import 'package:bus_booking/Trips/tickets/ticket_controller.dart';
import 'package:bus_booking/Trips/tickets/ticket_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllTickets extends StatefulWidget {
  const AllTickets({super.key});

  @override
  State<AllTickets> createState() => _AllTicketsState();
}

class _AllTicketsState extends State<AllTickets> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TicketController,TicketStates>(
       builder: (context, state) {
         if (state is TicketLoadingstates) {
                return CircularProgressIndicator();
              } else if (state is TicketErorrstates) {
                return Text("Some Thing went Wrong");
              }else {
                return Scaffold(
                  body: ListView.builder(
                        itemCount: BlocProvider.of<TicketController>(context)
                            .getTicket
                            .length,
                        itemBuilder: ((context, index) {
                          return Tickets(
                              
                              BlocProvider.of<TicketController>(context).getTicket[index]
                                  ,isDetails: false,);
                        })),
                    );
              }
       }
       
    );
  }
}