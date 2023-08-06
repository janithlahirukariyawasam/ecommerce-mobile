import 'package:e_commerce_mobile/allproduct.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("කප්රුක")),backgroundColor: Colors.black,),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(28.0),
              child: Image(image: NetworkImage("https://th.bing.com/th/id/R.9dc3f19f75b68ced7e78ca0d35fe0090?rik=7bNktAtRFTZLPg&pid=ImgRaw&r=0")),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AllProducts()),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(28.0),
                child: Container(
                  height: 100,
                  color: Colors.purpleAccent.shade100,
                  child: Center(child: Text("All Products",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800),)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(28.0),
              child: Container(
                height: 100,
                color: Colors.yellow.shade100,
                child: Center(child: Text("Categories",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800),)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(28.0),
              child: Container(
                height: 100,
                color: Colors.green.shade100,
                child: Center(child: Text("My Account",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800),)),
              ),
            ),



          ],
          

        ),
      ),
    );
  }
}
