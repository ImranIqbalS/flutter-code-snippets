import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final formKey = GlobalKey<FormState>(); //key for form
  String name = "";
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: Color(0xFFffffff),
        body: Container(
          padding: const EdgeInsets.only(left: 40, right: 40),
          child: Form(
            key: formKey, //key for form
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height * 0.04),
                Text(
                  "Here to Get",
                  style: TextStyle(fontSize: 30, color: Color(0xFF363f93)),
                ),
                Text(
                  "Welcomed !",
                  style: TextStyle(fontSize: 30, color: Color(0xFF363f93)),
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "enter your name",
                  ),
                  validator: (value) {
                    if (value!.isEmpty ||
                        RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                      return "enter correct name";
                    } else {
                      return null;
                    }
                  },
                ),
              SizedBox(
                  height: height * 0.05,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "enter your phone number",
                  ),
                  validator: (value) {
                    if (value!.isEmpty ||
                        RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]+$').hasMatch(value)) {
                      return "enter correct phone";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "enter your email",
                  ),
                  validator: (value) {
                    if (value!.isEmpty ||
                        RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}').hasMatch(value)) {
                      return "enter correct email";
                    } else {
                      return null;
                    }
                  },
                ),
                ElevatedButton(onPressed: (){
                  if(formKey.currentState!.validate()){
                    final snackBar = SnackBar(content: Text("submit"));
                    _scaffoldKey.currentState!.showSnackBar(snackBar); 
                  }
                }, child: Text("submit"))
              ],
            ),
          ),
        ));
  }
}
