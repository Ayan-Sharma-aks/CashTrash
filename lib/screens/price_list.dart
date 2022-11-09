import 'package:flutter/material.dart';
import 'package:firebase_auth101/screens/home_screen.dart';
import 'package:firebase_auth101/screens/pickup_req.dart';
import 'package:firebase_auth101/screens/history.dart';

class PriceList extends StatefulWidget {
  const PriceList({Key? key}) : super(key: key);

  @override
  State<PriceList> createState() => _PriceListState();
}

class _PriceListState extends State<PriceList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu),
        ),
        title: Text('Price List',style: TextStyle(fontSize: 25),),
        backgroundColor: Colors.green,
        automaticallyImplyLeading: false,
      ),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 50, 20, 10),
            child: GridView(
              children: [
                Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0),color: Colors.blueGrey.shade100),
                  child: Column(
                    children: [
                      Icon(Icons.newspaper,size: 50,color: Colors.white,),
                      SizedBox(height: 10),
                      Text('NewsPaper',style: TextStyle(color: Colors.black,fontSize: 30),),
                      SizedBox(height: 5),
                      Text('Rs.15/KG',style: TextStyle(color: Colors.black,fontSize: 20),)

                    ],
                  ),
                ),
                Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0),color: Colors.blueGrey.shade100),
                  child: Column(
                    children: [
                      Icon(Icons.backpack,size: 50,color: Colors.white,),
                      SizedBox(height: 10),
                      Text('Plastic',style: TextStyle(color: Colors.black,fontSize: 30),),
                      SizedBox(height: 5),
                      Text('Rs.20/KG',style: TextStyle(color: Colors.black,fontSize: 20),)

                    ],
                  ),
                ),
                Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0),color: Colors.blueGrey.shade100),
                  child: Column(
                    children: [
                      Icon(Icons.laptop,size: 50,color: Colors.white,),
                      SizedBox(height: 10),
                      Text('E-Waste',style: TextStyle(color: Colors.black,fontSize: 30),),
                      SizedBox(height: 5),
                      Text('Rs.80/KG',style: TextStyle(color: Colors.black,fontSize: 20),)

                    ],
                  ),
                ),
                Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0),color: Colors.blueGrey.shade100),
                  child: Column(
                    children: [
                      Icon(Icons.iron,size: 50,color: Colors.white,),
                      SizedBox(height: 10),
                      Text('Metal',style: TextStyle(color: Colors.black,fontSize: 30),),
                      SizedBox(height: 5),
                      Text('Rs.40/KG',style: TextStyle(color: Colors.black,fontSize: 20),)
                    ],
                  ),
                ),

                Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0),color: Colors.blueGrey.shade100),
                  child: Column(
                    children: [
                      Icon(Icons.newspaper,size: 50,color: Colors.white,),
                      SizedBox(height: 10),
                      Text('Mixed Waste',style: TextStyle(color: Colors.black,fontSize: 30),),
                      SizedBox(height: 5),
                      Text('Rs.60/KG',style: TextStyle(color: Colors.black,fontSize: 20),)
                    ],
                  ),
                ),
                Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0),color: Colors.blueGrey.shade100),
                  child: Column(
                    children: [
                      Icon(Icons.newspaper,size: 50,color: Colors.white,),
                      SizedBox(height: 10),
                      Text('Metal',style: TextStyle(color: Colors.black,fontSize: 30),),
                      SizedBox(height: 5),
                      Text('Rs.60/KG',style: TextStyle(color: Colors.black,fontSize: 20),)
                    ],
                  ),
                ),
              ],
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 10,crossAxisSpacing: 10),
            ),
          ),
        ),

        bottomNavigationBar: BottomAppBar(
          color: Colors.green,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: IconButton(
                  icon: Icon(Icons.home, size: 32.0,color: buttonSelected==1 ? Colors.white : Colors.black,),
                  onPressed: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const HomeScreen()));
                    buttonSelected=1;
                  },),

              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: IconButton(
                  icon: Icon(Icons.currency_rupee, size: 32.0,color: buttonSelected==2 ? Colors.white : Colors.black),
                  onPressed: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const PriceList()));

                  },),
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: IconButton(
                  icon: Icon(Icons.delivery_dining, size: 32.0,color: buttonSelected==3 ? Colors.white : Colors.black),
                  onPressed: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const PickupReq()));

                  },),
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: IconButton(
                  icon: Icon(Icons.history, size: 32.0,color: buttonSelected==4 ? Colors.white : Colors.black),
                  onPressed: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const HistoryPage()));

                  },),
              ),
            ],
          ),
          //child: Icon(Icons.home),
        ),
      ),

    );

  }
}
