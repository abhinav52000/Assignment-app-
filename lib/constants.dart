import 'package:flutter/material.dart';

OutlineInputBorder ktextfieldborder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(10),
  borderSide: const BorderSide(color: Colors.black),
);

Widget loggedinscreen({required String data}) {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black),
      borderRadius: BorderRadius.circular(15),
    ),
    padding: const EdgeInsets.all(15),
    child: Text(
      data,
      textAlign: TextAlign.center,
      style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
    ),
  );
}

Widget myButton({required Function() requiredjob, required String typedata}) {
  return RawMaterialButton(
    onPressed: requiredjob,
    constraints: const BoxConstraints(minHeight: 70, minWidth: double.infinity),
    fillColor: Colors.blue,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    child: Text(
      typedata,
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 30,
      ),
    ),
  );
}
