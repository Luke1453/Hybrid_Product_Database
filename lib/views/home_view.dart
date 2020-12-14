import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:firebase_database/firebase_database.dart';

import 'package:hybrid_product_db/utility/globals.dart' as globals;
import 'package:hybrid_product_db/models/product.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  DatabaseReference databaseReference;
  List<Product> productList = List<Product>();

  @override
  void initState() {
    super.initState();
    databaseReference = FirebaseDatabase.instance.reference();

    // populating product list
    databaseReference.once().then((DataSnapshot snapshot) {
      var productJsonList = List.from(snapshot.value);
      productJsonList.removeWhere((element) => element == null);
      productList = productJsonList.map((e) => Product.fromJson(e)).toList();
      print(productList);
      setState(() {
        print("re-rendering");
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(globals.appName),
        ),
        body: productListView()
    );
  }

  Widget productListView() {
    if (productList.isEmpty) {
      return
      //todo:animation here
        Center(
            child: Text("Uh Oh, no products in our database..."));
    }else{
      return ListView.builder(
          itemCount: productList.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              elevation: 8,
              child: InkWell(
                  // todo: edit product on screen press
                  onTap: null,
                  child: Container(
                    // Sets the padding for all elements in the container
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 15,
                      ),
                      child: Container(
                        // This makes the with of the element 65 % of the device-width
                          width: MediaQuery.of(context).size.width * 0.65,
                          child: Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Text(
                                        productList[index].name,
                                        style: TextStyle(
                                            fontSize:
                                            globals.kDefaultHeaderSize,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    productList[index].description,
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300,
                                      color: globals.kAccentBlack,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 10),
                              Container(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  productList[index].description,
                                  style: TextStyle(
                                    color: globals.kAccentBlack,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                              ),
                            ],
                          )))),
            );
          });
    }

  }

  void readData(){
    databaseReference.once().then((DataSnapshot snapshot) {
      print('Data : ${snapshot.value}');
    });
  }
}



//   // void createData(){
//   //   databaseReference.child("flutterDevsTeam1").set({
//   //     'name': 'Deepak Nishad',
//   //     'description': 'Team Lead'
//   //   });
//   //   databaseReference.child("flutterDevsTeam2").set({
//   //     'name': 'Yashwant Kumar',
//   //     'description': 'Senior Software Engineer'
//   //   });
//   //   databaseReference.child("flutterDevsTeam3").set({
//   //     'name': 'Akshay',
//   //     'description': 'Software Engineer'
//   //   });
//   //   databaseReference.child("flutterDevsTeam4").set({
//   //     'name': 'Aditya',
//   //     'description': 'Software Engineer'
//   //   });
//   //   databaseReference.child("flutterDevsTeam5").set({
//   //     'name': 'Shaiq',
//   //     'description': 'Associate Software Engineer'
//   //   });
//   //   databaseReference.child("flutterDevsTeam6").set({
//   //     'name': 'Mohit',
//   //     'description': 'Associate Software Engineer'
//   //   });
//   //   databaseReference.child("flutterDevsTeam7").set({
//   //     'name': 'Naveen',
//   //     'description': 'Associate Software Engineer'
//   //   });
//   //
//   // }
//   //
//   // void updateData(){
//   //   databaseReference.child('flutterDevsTeam1').update({
//   //     'description': 'CEO'
//   //   });
//   //   databaseReference.child('flutterDevsTeam2').update({
//   //     'description': 'Team Lead'
//   //   });
//   //   databaseReference.child('flutterDevsTeam3').update({
//   //     'description': 'Senior Software Engineer'
//   //   });
//   // }
//   //
//   // void deleteData(){
//   //   databaseReference.child('flutterDevsTeam1').remove();
//   //   databaseReference.child('flutterDevsTeam2').remove();
//   //   databaseReference.child('flutterDevsTeam3').remove();
//   //
//   // }
