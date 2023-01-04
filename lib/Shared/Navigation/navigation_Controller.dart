import 'package:bloc/bloc.dart';
import 'package:bus_booking/Shared/Navigation/navigation_states.dart';
import 'package:bus_booking/Shared/shared_Screen/home.dart';
import 'package:bus_booking/Trips/tickets/myTickets_screen.dart';

import '../shared_Screen/profile_screen.dart';

class NavigationController extends Cubit<NavigationStates>{
     NavigationController():super(ChangeNav(MyTickets(),1));

List screens = [home(), MyTickets(), profile()];

void move (int index){
  emit(ChangeNav(screens[index], index));
}
     

}