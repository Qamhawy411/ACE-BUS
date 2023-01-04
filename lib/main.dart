import 'package:bus_booking/Shared/Navigation/navigation_Controller.dart';
import 'package:bus_booking/Shared/Navigation/navigation_Screen.dart';
import 'package:bus_booking/Shared/shared_Screen/trip_offerScreen.dart';
import 'package:bus_booking/Trips/tickets/ticket_controller.dart';
import 'package:bus_booking/Trips/trip_screens/trip_details.dart';
import 'package:bus_booking/User/Screens/SplashScreen.dart';
import 'package:bus_booking/User/Screens/login.dart';
import 'package:bus_booking/User/Screens/signout.dart';
import'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
void main()=> runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TicketController(),),
        BlocProvider(create:((context) => NavigationController()) ,)
      ],
      child: MaterialApp(
        
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}