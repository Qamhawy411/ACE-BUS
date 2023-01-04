import 'package:google_maps_flutter/google_maps_flutter.dart';

class TicketModel {
  String ticketId;
  String busMoveplace;
  String busarriveplace;
  String ticketSalary;
  String caseWay;
  int moveTime;
  int arriveTime;
  String companyName;
  String arrivePlace1;
  String arrivePlace2;
  String movePlace1;
  double  latmovePlace;
  double  latarrivePlace;
   double  lngmovePlace;
  double  lngarrivePlace;
  String movePlace2;
  bool isBooked;
  String salaryCase;
  String details;
  List transfer;
  TicketModel(
      {
        required this.lngmovePlace,
        required this.lngarrivePlace,
        required this.latmovePlace,
        required this.latarrivePlace,
        required this.ticketId,
      required this.transfer,
      required this.details,
      required this.salaryCase,
      required this.isBooked,
      required this.busarriveplace,
      required this.busMoveplace,
      required this.movePlace1,
      required this.movePlace2,
      required this.arrivePlace1,
      required this.arrivePlace2,
      required this.arriveTime,
      required this.caseWay,
      required this.companyName,
      required this.moveTime,
      required this.ticketSalary});

  factory TicketModel.Json(Map data, String id) {
    return TicketModel(
      lngarrivePlace:data["lngarrivePlace"],
        lngmovePlace:data["lngmovePlace"],
        latarrivePlace:data["latarrivePlace"],
        latmovePlace:data["latmovePlace"],
        ticketId: id,
        transfer: data["transfer"],
        details: data["details"],
        salaryCase: data["salaryCase"],
        isBooked: data["isBooked"],
        busarriveplace: data["busarriveplace"],
        busMoveplace: data["busMoveplace"],
        movePlace1: data["movePlace1"],
        movePlace2: data["movePlace2"],
        arrivePlace1: data["arrivePlace1"],
        arrivePlace2: data["arrivePlace2"],
        arriveTime: data["arriveTime"],
        caseWay: data["caseWay"],
        companyName: data["companyName"],
        moveTime: data["moveTime"],
        ticketSalary: data["ticketSalary"]);
  }
}
