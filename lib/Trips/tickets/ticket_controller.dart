import 'package:bus_booking/Trips/tickets/ticket_model.dart';
import 'package:bus_booking/Trips/tickets/ticket_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as htttp;
import 'dart:convert';
import 'package:bloc/bloc.dart';

class TicketController extends Cubit<TicketStates> {
  TicketController() : super(TicketInitialState()) {
    getTickets();
    getbooked();
    
  }
  List _Tickets = [];
  List get getTicket => _Tickets;
  List _booked = [];
  List get getticketbooked => _booked;
  List _searched = [];
  List get getSearched => _searched;
  Future<void> getTickets() async {
    emit(TicketLoadingstates());
    try {
      htttp.Response response = await htttp.get(Uri.parse(
          "https://busbooking-2366f-default-rtdb.firebaseio.com/tickets.json"));
      Map data = json.decode(response.body);
      if (response.statusCode == 200) {
        data.forEach((key, value) {
          _Tickets.add(TicketModel.Json(value, key));
        });
        emit(TicketGetstates());
      } else {
        emit(TicketErorrstates());
      }
    } catch (e) {
      print(e);
      emit(TicketErorrstates());
    }
    print(state);
  }

  Future<void> getbooked() async {
    emit(BookedLoadingState());
    try {
      htttp.Response response = await htttp.get(Uri.https(
          "https://busbooking-2366f-default-rtdb.firebaseio.com/booked.json"));
      Map data = json.decode(response.body);
      if (response.statusCode == 200) {
        data.forEach((key, value) {
          for (TicketModel ticket in _Tickets) {
            if (ticket.ticketId == value["ticketId"]) {
              ticket.isBooked = true;
              _booked.add(ticket);
            }
            if (ticket.isBooked == true) {
              ticket.isBooked = true;
              _booked.add(ticket);
            }
          }
        });

        emit(BookedGetState());
      } else {
        emit(BookedErorrState());
      }
      print(response.statusCode);
    } catch (e) {
      emit(BookedErorrState());
    }

    print(state);
  }

  Future<bool> addToBooked(TicketModel ticket) async {
    Map data = {"ticketId": ticket.ticketId, "userId": 1};
    htttp.Response response = await htttp.post(
        Uri.parse(
            "https://busbooking-2366f-default-rtdb.firebaseio.com/booked.json"),
        body: json.encode(data));
    if (response.statusCode == 200) {
      ticket.isBooked = true;
      _booked.add(ticket);
      return true;
    }
    return false;
  }

  Future<bool> removeFromwishlist(TicketModel ticket) async {
    htttp.Response response = await htttp.delete(Uri.parse(
        "https://busbooking-2366f-default-rtdb.firebaseio.com/booked/${ticket.ticketId}.json"));
    if (response.statusCode == 200) {
      ticket.isBooked = false;
      for (int i = 0; i < _booked.length; i++) {
        if (ticket.ticketId == _booked[i]["ticketId"]) {
          _booked.removeAt(i);
        }
      }
      return true;
    }
    return false;
  }

  Future<void> handelAddandRemove(TicketModel ticket) async {
    bool isSuccess = false;
    if (ticket.isBooked) {
      isSuccess = await removeFromwishlist(ticket);
    } else {
      isSuccess = await addToBooked(ticket);
    }
    emit(isSuccess ? HandeldGetState() : HandeldErorrState());
  }

  Searching(String text1,String text2) {
    _searched.clear();
    for (TicketModel tic in _Tickets) {
      if (tic.arrivePlace1.toLowerCase() == text2.toLowerCase() ||
          tic.arrivePlace2.toLowerCase() == text2.toLowerCase() ||
          tic.movePlace1.toLowerCase() == text1.toLowerCase() ||
          tic.movePlace2.toLowerCase() == text1.toLowerCase()) {
            _searched.add(tic);
          } else  {
            return Center(child: Text("eee"),);
          }
    }
  }
}
