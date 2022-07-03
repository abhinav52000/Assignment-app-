import 'package:assignment_project/constants.dart';
import 'package:assignment_project/main.dart';
import 'package:assignment_project/profileScreen.dart';
import 'package:assignment_project/userdetail.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RegisterDetail extends StatefulWidget {
  RegisterDetail({Key? key, required this.data}) : super(key: key);
  dynamic data;

  @override
  State<RegisterDetail> createState() => _RegisterDetailState();
}

class _RegisterDetailState extends State<RegisterDetail> {
  late double age;
  var gender = ['Male', 'Female', 'Prefer Not To Tell'];
  String? gendervalue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: 500,
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.fromLTRB(15, 150, 15, 0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 1),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Welcome!\t\t${widget.data['name']}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextField(
              onChanged: (value) {
                setState(() {
                  age = double.parse(value);
                });
              },
              showCursor: true,
              cursorColor: Colors.black,
              cursorWidth: 0.5,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  floatingLabelAlignment: FloatingLabelAlignment.center,
                  hintText: 'Your Age',
                  enabledBorder: ktextfieldborder,
                  focusedBorder: ktextfieldborder
                  // Border.all(color: Colors.black,)
                  ),
            ),
            Container(
              height: 60,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10)),
              child: DropdownButton(
                value: gendervalue,
                hint: const Center(
                  child: Text(
                    'Your Gender',
                  ),
                ),
                borderRadius: BorderRadius.circular(15),
                items: gender.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                // After selecting the desired option,it will
                // change button value to selected value
                onChanged: (String? newValue) {
                  setState(() {
                    gendervalue = newValue!;
                  });
                },
              ),
            ),
            myButton(
                requiredjob: (() {
                  setState(() {
                    box.put(
                        int.parse(widget.data['id']),
                        UserDetail(
                            id: int.parse(widget.data['id']),
                            name: widget.data['name'],
                            gender: gendervalue.toString(),
                            age: age));
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return LoginScreen(myid: int.parse(widget.data['id']));
                      }),
                    );
                  });
                }),
                typedata: 'SIGN UP'),
          ],
        ),
      ),
    );
  }
}
