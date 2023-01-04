import 'package:flutter/material.dart';

abstract class NavigationStates{} 
class ChangeNav extends NavigationStates {
  int screen;
  Widget ScreenShow;
  ChangeNav(this.ScreenShow,this.screen);
}