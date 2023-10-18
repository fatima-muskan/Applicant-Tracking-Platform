import 'package:crud/Service/api.dart';
import 'package:crud/create.dart';
import 'package:crud/fetch.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CRUD Operations'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context) => AddPro()));
  
                },
                child: Text('Create'),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  // Edit operation logic
                },
                child: Text('Edit'),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  // Delete operation logic
                },
                child: Text('Delete'),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed:() async {
                   Navigator.push(context, MaterialPageRoute(builder: (context) => Fetchdata()));
                },
                child: Text('Retrieve'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
