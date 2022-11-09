import 'package:firebase_auth101/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth101/screens/price_list.dart';
import 'package:firebase_auth101/screens/history.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';



class PickupReq extends StatefulWidget {
  const PickupReq({Key? key}) : super(key: key);

  @override
  State<PickupReq> createState() => _PickupReqState();
}

class _PickupReqState extends State<PickupReq> {
  // static const _initialCameraPosition = CameraPosition(
  //   target: LatLng(37.773972, -122.431297),
  //   //zoom: 11.5,
  // );

  @override
  Widget build(BuildContext context) {
    int buttonSelected = 3;
    return Scaffold(
      // body: const GoogleMap(
      //   myLocationButtonEnabled: false,
      //   zoomControlsEnabled: false,
      //   initialCameraPosition: _initialCameraPosition,
      // ),

      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu),
        ),
        automaticallyImplyLeading: false,
        title: Text('PickUp Request'),
        backgroundColor: Colors.green,
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.green,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: IconButton(
                icon: Icon(Icons.home, size: 32.0,color: buttonSelected==1 ? Colors.blueGrey : Colors.black,),
                onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const HomeScreen()));

                },),

            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: IconButton(
                icon: Icon(Icons.currency_rupee, size: 32.0,color: buttonSelected==2 ? Colors.blueGrey : Colors.black),
                onPressed: (){
                  buttonSelected =1;
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const PriceList()));

                },),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: IconButton(
                icon: Icon(Icons.delivery_dining, size: 32.0,color: buttonSelected==3 ? Colors.blueGrey : Colors.black),
                onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const PickupReq()));

                },),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: IconButton(
                icon: Icon(Icons.history, size: 32.0,color: buttonSelected==4 ? Colors.blueGrey : Colors.black),
                onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const HistoryPage()));

                },),
            ),
          ],
        ),
      ),

    );
  }
}
