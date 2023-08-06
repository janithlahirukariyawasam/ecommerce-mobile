import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

String URL = "https://localhost:8000/api/product/all-product";

class AllProducts extends StatefulWidget {
  const AllProducts({Key? key}) : super(key: key);

  @override
  State<AllProducts> createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {

  List<dynamic> employees = [];

  Future<void> _fetchEmployees() async {
    try {
      final response = await http.get(Uri.parse(URL));
      print('Response Body: ${response.body}');
      final responseData = json.decode(response.body);

      // Ensure that responseData is a map and contains "Products" key
      if (responseData is Map<String, dynamic> && responseData.containsKey("Products")) {
        final List<dynamic> productList = responseData["Products"];
        setState(() {
          employees = productList;
          print(employees);
        });
      } else {
        print('Invalid API response format. Expected a nested list under "Products".');
      }
    } catch (error) {
      print('Error while fetching data: $error');
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchEmployees();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: Text('All Products'),
      ),
      body: Container(
        color: Colors.black26,
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Container(
            child: ListView.builder(
              itemCount: employees.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.greenAccent
                                .withOpacity(0.3), //color of shadow
                            spreadRadius: 2, //spread radius
                            blurRadius: 2, // blur radius
                            offset: Offset(0, 3),
                          ),
                        ],
                        color: Colors.black12,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Container(
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Container(
                                  child: Center(
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Text(
                                            employees[index]['pName'],
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w800,
                                              color: Colors.black87,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            width: 200,
                                              child: Text(employees[index]['pDescription'])),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Center(
                                            child: Container(
                                                width: 200,
                                                child: Text("Rs ${employees[index]['pPrice']}",style: TextStyle(color: Colors.red,fontSize: 16),)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: AllProducts(),
  ));
}

