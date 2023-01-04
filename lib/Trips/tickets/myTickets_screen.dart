import 'package:bus_booking/Shared/shared_widget/Tickets.dart';
import 'package:bus_booking/Trips/tickets/ticket_controller.dart';
import 'package:bus_booking/Trips/tickets/ticket_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyTickets extends StatefulWidget {
  const MyTickets({super.key});

  @override
  State<MyTickets> createState() => _MyTicketsState();
}

class _MyTicketsState extends State<MyTickets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lime,
        title: Center(
          child: Text("My Tickets"),
        ),
      ),
      body: BlocBuilder<TicketController, TicketStates>(
        builder: (context, state) {
          if (state is BookedLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is BookedErorrState) {
            return Center(child: Text("Some thing erorr"));
          } else {
            return 
            Column(
              children: [
                SafeArea(child:Text("${BlocProvider.of<TicketController>(context).getticketbooked.length}item",style: TextStyle(color: Colors.lime,fontSize: 30),) ),
                Flexible(
                  child: ListView.builder(
                      itemCount: BlocProvider.of<TicketController>(context)
                          .getticketbooked
                          .length,
                      itemBuilder: ((context, index) {
                        return Tickets(
                            BlocProvider.of<TicketController>(context)
                                .getticketbooked[index],
                            isDetails: true);
                      })),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
