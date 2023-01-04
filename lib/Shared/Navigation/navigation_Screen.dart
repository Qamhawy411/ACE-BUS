import 'package:bus_booking/Shared/Navigation/navigation_Controller.dart';
import 'package:bus_booking/Shared/Navigation/navigation_states.dart';
import 'package:bus_booking/Shared/shared_Screen/home.dart';
import 'package:bus_booking/Shared/shared_Screen/profile_screen.dart';
import 'package:bus_booking/Shared/shared_Screen/trip_offerScreen.dart';
import 'package:bus_booking/Trips/tickets/myTickets_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class navigationScreen extends StatefulWidget {
  const navigationScreen({super.key});

  @override
  State<navigationScreen> createState() => _navigationScreenState();
}

class _navigationScreenState extends State<navigationScreen> {
  
  int select = 0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationController,NavigationStates>(
      builder: ((context, state) => 
       Scaffold(
        bottomNavigationBar: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: GNav(
                tabs: [
                  GButton(icon: Icons.home, text: " Home "),
                  GButton(icon: Icons.remember_me, text: " My Tickets"),
                  GButton(icon: Icons.person, text: " Person "),
                ],
                onTabChange: (value) {
                  BlocProvider.of<NavigationController>(context).move(value);
                  select=value;
                },
                activeColor: Colors.white,
                color: Colors.white,
                backgroundColor: Color(0xff070E2B),
                iconSize: 20,
                gap: 50,
                tabBackgroundColor: Colors.grey.shade800,
              ),
            ),
          ),
        ),
        body: BlocProvider.of<NavigationController>(context).screens[select]
      )
    ));
  }
}
