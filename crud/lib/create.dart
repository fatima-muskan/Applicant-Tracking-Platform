import 'package:crud/Service/api.dart';
import 'package:flutter/material.dart';


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AddPro(),
    );
  }
}

class AddPro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Product'),
      ),
      body: AddProductForm(),
    );
  }
}

class AddProductForm extends StatefulWidget {
  @override
  _AddProductFormState createState() => _AddProductFormState();
}

class _AddProductFormState extends State<AddProductForm> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(
            controller: nameController,
            decoration: InputDecoration(labelText: 'Product Name'),
          ),
          SizedBox(height: 16.0),
          TextField(
            controller: priceController,
            decoration: InputDecoration(labelText: 'Price'),
          ),
          SizedBox(height: 16.0),
          TextField(
            controller: descriptionController,
            decoration: InputDecoration(labelText: 'Description'),
          ),
          SizedBox(height: 32.0),
          ElevatedButton(
            onPressed: () {
              // Add product logic using the values from the text fields
              var data ={
              "pname" : nameController.text,
              "pdisc" : descriptionController.text,
              "pprice" : priceController.text
              };
               API.addProduct(data);
              // Handle the logic to add the product to your database or perform any action here
              //print('Name: $name, Price: $price, Description: $description');
            },
            child: Text('Add'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    priceController.dispose();
    descriptionController.dispose();
    super.dispose();
  }
}
