
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dashboard_model.dart';

class DeliveryFragment extends StatefulWidget {
  const DeliveryFragment({Key? key}) : super(key: key);

  @override
  MyDeliveryFragment createState() => MyDeliveryFragment();
}

class MyDeliveryFragment extends State<DeliveryFragment> {
  late Future<List<Datum>> futurePost;

  @override
  void initState() {
    super.initState();
    futurePost = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate back to first route when tapped.
          },
          child: FutureBuilder(
              future: futurePost,
              builder: (context, AsyncSnapshot snapshot) {
                /*if (snapshot.hasData) {
                return Text(snapshot.data.page);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // spinner
              return CircularProgressIndicator();*/

                if (snapshot.hasData) {
                  return ListView.builder(
                    shrinkWrap: true, //just set this property
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data.length,
                    itemBuilder: (_, index) => Container(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        padding: EdgeInsets.all(20.0),
                        decoration: BoxDecoration(
                          color: Color(0xff97FFFF),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${snapshot.data![index].email}",
                              style: const TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text("${snapshot.data![index].firstName}"),
                          ],
                        ),
                      ),
                    ),
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
                //child: _pages.elementAt(_selectedIndex),
              }),
        ),
      ),
    );
  }

  Future<List<Datum>> fetchData() async {
    print("call datum");
    final response =
    await http.get(Uri.parse('https://reqres.in/api/users?page=2'));
    //print(response.body);

    if (response.statusCode == 200) {
      DashboardModel dashboardModel =
      DashboardModel.fromJson(jsonDecode(response.body));
      return dashboardModel.data;
    } else {
      throw Exception('Failed to load album');
    }
  }
}
