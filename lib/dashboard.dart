import 'package:flutter/material.dart';
import 'package:flutter_zomato_ui/constant.dart';
import 'package:flutter_zomato_ui/delivery_fragment.dart';
import 'package:flutter_zomato_ui/dinein_fragment.dart';
import 'package:flutter_zomato_ui/offers_fragment.dart';
import 'package:flutter_zomato_ui/wallet_fragment.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  MyDashboard createState() => MyDashboard();
}

class MyDashboard extends State<Dashboard> {
  //Your code here
  late int _selectedIndex = 0; //New

  final widgetTitle = ["Delivery", "Dine-In", "Offers","Wallet"];

  final widgetOptions = [
    new DeliveryFragment(),
    new DiningFragment(),
    new OffersFragment(),
    new WalletFragment(),

  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widgetTitle.elementAt(_selectedIndex)),
        backgroundColor: Colors.red,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1485290334039-a3c69043e517?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTYyOTU3NDE0MQ&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=300'),
              ),
              accountEmail: Text('jane.doe@example.com'),
              accountName: Text(
                'Jane Doe',
                style: TextStyle(fontSize: 24.0),
              ),
              decoration: BoxDecoration(
                color: Colors.black87,
              ),
            ),
            ListTile(
              title: const Text('Profile'),
              selectedColor: Colors.green,
              leading: const Icon(Icons.supervised_user_circle),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed(PROFILE_SCREEN);
              },
            ),
            ListTile(
              title: const Text('Refer'),
              selectedColor: Colors.green,
              leading: const Icon(Icons.home),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed(REFER_SCREEN);
              },
            ),
            ListTile(
              title: const Text('Settings'),
              selectedColor: Colors.green,
              leading: const Icon(Icons.settings),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed(SETTINGS_SCREEN);
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.call),
            label: 'Delivery',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            label: 'Dining',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Offers',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Wallet',
          ),
        ],
        onTap: _onItemTapped,
        currentIndex: _selectedIndex, //New
      ),
      body: Center(
        child: widgetOptions.elementAt(_selectedIndex),

      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
