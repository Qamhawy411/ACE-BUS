import 'package:bus_booking/Shared/shared_widget/Tickets.dart';
import 'package:bus_booking/Trips/tickets/ticket_controller.dart';
import 'package:bus_booking/Trips/tickets/ticket_model.dart';
import 'package:bus_booking/Trips/tickets/ticket_states.dart';
import 'package:bus_booking/Trips/trip_screens/mapwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TicketDetail extends StatefulWidget {
  TicketModel ticket;
   TicketDetail(this.ticket,{super.key});

  @override
  State<TicketDetail> createState() => _TicketDetailState();
}

class _TicketDetailState extends State<TicketDetail> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TicketController,TicketStates>(
        builder: (context, state) => 
         ListView(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 2.7,
              width: 40,
              color: Colors.amber,
                 child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60)),
                  child: MapWidget(ticket: widget.ticket,)
                   ),
            ),
            Tickets(isDetails: true,widget.ticket),
          ],
        ),
      ),
    );
  }
}
