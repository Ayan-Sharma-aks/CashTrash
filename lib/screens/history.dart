import 'package:firebase_auth101/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth101/screens/price_list.dart';
import 'package:firebase_auth101/screens/pickup_req.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    int buttonSelected = 4;
    return Container(

      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Drawer(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    DrawerHeader(
                      child: Text(
                        'Side menu',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.green,
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage('assets/images/cover.jpg'))),
                    ),
                    ListTile(
                      leading: Icon(Icons.input),
                      title: Text('Welcome'),
                      onTap: () => {},
                    ),
                    ListTile(
                      leading: Icon(Icons.verified_user),
                      title: Text('Profile'),
                      onTap: () => {Navigator.of(context).pop()},
                    ),
                    ListTile(
                      leading: Icon(Icons.settings),
                      title: Text('Settings'),
                      onTap: () => {Navigator.of(context).pop()},
                    ),
                    ListTile(
                      leading: Icon(Icons.border_color),
                      title: Text('Feedback'),
                      onTap: () => {Navigator.of(context).pop()},
                    ),
                    ListTile(
                      leading: Icon(Icons.exit_to_app),
                      title: Text('Logout'),
                      onTap: () => {Navigator.of(context).pop()},
                    ),
                  ],
                ),
              );
            },
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
          //child: Icon(Icons.home),
        ),
      ),
    );
  }
}
