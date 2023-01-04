import 'dart:collection';
import 'package:bus_booking/Trips/tickets/ticket_model.dart';
import 'package:google_maps_webservice/directions.dart' as directions;

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapWidget extends StatefulWidget {
  TicketModel ticket;
   MapWidget({required this.ticket,super.key});

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  
  Set<Marker> markers = Set<Marker>();
 late List<LatLng> polyLineCordinates = [LatLng(widget.ticket.latarrivePlace,widget.ticket.lngarrivePlace),LatLng(widget.ticket.latmovePlace,widget.ticket.lngmovePlace)];

  List<LatLng> direction = [
    LatLng(30.693599594204947, 31.41690731049164),
    LatLng(30.693599594204947, 31.41690731049164),
    LatLng(30.693536286228788, 31.41901667473548),
    LatLng(30.693599594204947, 31.41690731049164),
    LatLng(30.696235669195953, 31.418296501618453),
    LatLng(30.693599594204947, 31.41690731049164)
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        circles: {
          Circle(
              circleId: CircleId("1"),
              center: LatLng(widget.ticket.latmovePlace,widget.ticket.lngmovePlace),
              radius: 500,
              fillColor: Colors.blue.withOpacity(.2),
              strokeWidth: 2)
        },
        initialCameraPosition: CameraPosition(
          target: (LatLng(widget.ticket.latmovePlace,widget.ticket.lngmovePlace)),
          zoom: 30,
        ),
        onMapCreated: (controller) {},
        polygons: {
          Polygon(
            polygonId: PolygonId("1"),
            points: direction,
          )
        },
        polylines: {
          Polyline(
              polylineId: PolylineId("route"),
              color: Colors.pink,
              points: polyLineCordinates,
              width: 5)
        },
        myLocationButtonEnabled: true,
        myLocationEnabled: true,
        mapType: MapType.normal,
        markers: {
          Marker(
              markerId: MarkerId("1"),
              position: LatLng(widget.ticket.latarrivePlace,widget.ticket.lngarrivePlace),
              infoWindow: InfoWindow(title: "Qam7awy")),
          Marker(
              markerId: MarkerId("1"),
              position: LatLng(widget.ticket.latmovePlace,widget.ticket.lngmovePlace),
              infoWindow: InfoWindow(title: "Qam7awy2"))
        },
      ),
    );
  }
}
