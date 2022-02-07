// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage(
      {Key? key,
      required this.Name,
      required this.Email,
      required this.Mobile,
      required this.Collegename,
      required this.Password})
      : super(key: key);

  //to avoid Late initialize error use  above syntaxt , dont use Learn code online syntaxt
  final String Name, Email, Mobile, Collegename , Password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text('Students Info'),
      ),
      body: Form(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(50.0),
              ),
              Image(
                image: AssetImage('images/logo.png'),
                width: 100.0,
                height: 100.0,
              ),
              ListTile(
                leading: Icon(Icons.people),
                title: Text(Name),
              ),
              ListTile(
                leading: Icon(Icons.email),
                title: Text(Email),
              ),
              ListTile(
                leading: Icon(Icons.phone),
                title: Text(Mobile),
              ),
              ListTile(
                leading: Icon(Icons.school),
                title: Text(Collegename),
              ),
              ListTile(
                leading: Icon(Icons.password),
                title: Text(Password),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
