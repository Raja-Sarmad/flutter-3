import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:myapp/dashboard.dart';
import 'package:myapp/home.dart';
import 'package:myapp/login.dart';


class _NewDashboardView extends State<NewDashboardView2> {
  @override
  var currentIndex = 0;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: getCurrentView(),
      
      bottomNavigationBar: BottomNavigationBar(items: const[BottomNavigationBarItem(icon:Icon(Icons.home), label: "Home"),
      BottomNavigationBarItem(icon:Icon(Icons.home),label: "Home"),
      BottomNavigationBarItem(icon:Icon(Icons.home),label: "Home"),
      BottomNavigationBarItem(icon:Icon(Icons.home),label: "Home"),
      ]),
    );
  }

  Widget getCurrentView(){
    if(currentIndex == 0){
      return HomeView();
    }
    else if (currentIndex == 1){
      return DashboardView();
    }
    else 
    return LoginView();
  }
}