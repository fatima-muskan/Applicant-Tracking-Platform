
import 'dart:convert';

import 'package:crud/Model/product.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class API{
  static const baseUrl="http://localhost:3000/api/";
  static addProduct(Map pdata) async{
    var url=Uri.parse("${baseUrl}addProduct");


    try{
      final res=await http.post(
        url,
        body:pdata
        , headers: {
        'Content-Type': 'application/json',
      });
      if(res.statusCode==200)
      {
         var data =jsonDecode(res.body.toString());
         print(data);
       }
      else{
         print("Failed to get data");
      }
    }
    catch(e){
      debugPrint(e.toString());
    }
  }

  static getProduct() async{
  //   var url=Uri.parse("${baseUrl}getProduct");
  
  // final res=await http.get(url);
  //   try{
  //     if(res.statusCode==200)
  //     {
  //       var data=jsonDecode(res.body);
  //       data['pl'].forEach((
  //         value)=>{
  //           pl.add(Product(name:value['pname'],disc: value['pdisc'],price: value['pprice'])),
  //         }
  //       );

  //       return pl;
  //      }
  //     else{
  //        return [];
  //     }
  //   }
  //   catch(e){
  //     debugPrint(e.toString());
  //   }
  Uri url=Uri.parse("http://localhost:3000/api/getProduct");
  final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        print(responseData);
        return responseData;
      }
       else {

        // Handle the error if the request fails
        // You can show an error message or take appropriate action here.
        print("No");
        return null;
      }
  }
}