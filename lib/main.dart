import 'dart:convert' as json;
import 'package:assignment_project/firsttimeloginscreen.dart';
import 'package:assignment_project/profileScreen.dart';
import 'package:assignment_project/userdetail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootbundle;
import 'package:hive_flutter/hive_flutter.dart';

dynamic box;

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(UserDetailAdapter());
  box = await Hive.openBox<UserDetail>('box');
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: FutureBuilder(
          future: readJsonData(),
          builder: (context, snapshot) {
            try {
              dynamic content = snapshot.data;
              if (content == null) {
                return const Center(child: CircularProgressIndicator());
              }
              return ListView.builder(
                itemCount: content[0]['users'].length,
                itemBuilder: ((context, index) {
                  return GestureDetector(
                    onTap: (() {
                      setState(() {
                        if (box.get(
                                int.parse(content[0]['users'][index]['id'])) ==
                            null) {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return RegisterDetail(
                              data: content[0]['users'][index],
                            );
                          }));
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return LoginScreen(
                                  myid: int.parse(
                                      content[0]['users'][index]['id']));
                            }),
                          );
                        }
                      });
                    }),
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(15)),
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Name: ${content[0]['users'][index]['name']}',
                            style: const TextStyle(fontSize: 20),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Atype: ${content[0]['users'][index]['atype']}',
                            style: const TextStyle(fontSize: 20),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Id: ${content[0]['users'][index]['id']}',
                            style: const TextStyle(fontSize: 20),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              );
            } catch (e) {
              return Center(
                child: Text(e.toString()),
              );
            }
          },
        ),
      ),
    );
  }
}

Future readJsonData() async {
  var jsondata =
      await rootbundle.rootBundle.loadString('jsonasset/jasondata.json');
  var list = json.jsonDecode(jsondata.toString());
  return list;
}
