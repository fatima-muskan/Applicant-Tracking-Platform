import 'package:crud/Model/product.dart';
import 'package:crud/Service/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// class Fetchdata extends StatelessWidget{
//   const Fetchdata({
//     super.key
//   });
//   @override
//   Widget build(BuildContext context){
//     return Scaffold(
//       appBar: AppBar(),
//       body: FutureBuilder(
//         future: API.getProduct(),
//         builder: (BuildContext context,AsyncSnapshot snapshot) {
//           if(!snapshot.hasData)
//           {
//             return Center(
//               child: CircularProgressIndicator(),
//             );

//           }
//           else{
//               List<Product> pdata=snapshot.data;
//               return ListView.builder(
//                 itemCount: pdata.length,
//                 itemBuilder: (BuildContext context,int index){
//                   return ListTile(
//                     leading: const Icon(Icons.storage),
//                     title: Text("${pdata[index].name}"),
//                     subtitle: Text("${pdata[index].disc}"),
//                     trailing: Text("${pdata[index].price}"),
//                   );
//                 },

//               );
//           }
//         },
//       ),
//     );
//   }


// }



class Fetchdata extends StatefulWidget{
  var jsonString = <Map<String, dynamic>>[];
  @override
  void initState() {
    super.initState();
    // Fetch data when the widget is initialized
    fetchResponseData();
  }
  // const Fetchdata({
  //   super.key
  // });
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Text(API.getProduct()),
      )
      
    );
  }
  
  void fetchResponseData() {
    Future<void> fetchData() async {
    try {
      final url = Uri.parse('http://localhost:3005/getUser');

      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        final results = responseData["results"];
        setState(() {
          jsonString = List<Map<String, dynamic>>.from(results);
          dataLoaded = true;
        });
      } else {
        print("Error");
      }
    } catch (e) {
      print("Error: $e");
    }
  }
  }
  
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }


}