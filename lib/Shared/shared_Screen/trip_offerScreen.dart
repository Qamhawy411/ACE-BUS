import 'package:bus_booking/Shared/shared_widget/Tickets.dart';
import 'package:bus_booking/Trips/tickets/ticket_controller.dart';
import 'package:bus_booking/Trips/tickets/ticket_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class tripOfffers_screen extends StatefulWidget {
  const tripOfffers_screen({super.key});

  @override
  State<tripOfffers_screen> createState() => _tripOfffers_screenState();
}

class _tripOfffers_screenState extends State<tripOfffers_screen> {
  List types = ["fastest", "cheapest", "fast and cheape"];
  int selected = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 3.5,
            width: 500,
            child: Column(
              children: [
                texty("\n \n Manchester to paris \n", Colors.white, 20),
                texty("nov,6,2020 \n", Colors.white, 18),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: ((context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: (() {
                            setState(() {
                              selected = index;
                            });
                          }),
                          child: Container(
                            padding: EdgeInsets.all(10),
                            child: Center(
                              child: Text(
                                types[index],
                                style: TextStyle(
                                    color: selected == index
                                        ? Colors.black
                                        : Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            decoration: BoxDecoration(
                                color: selected == index
                                    ? Colors.white
                                    : Colors.green,
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        ),
                      );
                    }),
                    itemCount: types.length,
                    scrollDirection: Axis.horizontal,
                  ),
                )
              ],
            ),
            decoration: BoxDecoration(
                color: Color(0xff070E2B),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
          ),
          BlocBuilder<TicketController, TicketStates>(
            builder: (context, state) {
              if (state is TicketLoadingstates) {
                return CircularProgressIndicator();
              } else if (state is TicketErorrstates) {
                return Text("Some Thing went Wrong");
              } else if ( BlocProvider.of<TicketController>(context).getSearched.length==0){
                 return  InkWell(
                    onTap: (() => Navigator.of(context).pop()),
                   child: Text("\n \n \n \n \n \n \n \n    there is not avalable text to this country\n       try to search again",style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Allison',
                                 )),
                 );
              } else {
                return Container(
                  height: MediaQuery.of(context).size.height * 2.5 / 3.5,
                  color: Colors.black26,
                  child: ListView.builder(
                      itemCount: BlocProvider.of<TicketController>(context)
                          .getSearched
                          .length,
                      itemBuilder: ((context, index) {
                        return Tickets(
                            BlocProvider.of<TicketController>(context).getSearched[index]
                                ,isDetails: false,);
                                
                      })),
                );
              }
            },
          )
        ],
      ),
    );
  }

  Text texty(String texty, Color colour, double size) {
    return Text(
      texty,
      style:
          TextStyle(color: colour, fontSize: size, fontWeight: FontWeight.w900),
    );
  }
}
