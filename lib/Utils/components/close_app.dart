import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:elite_edge_labs/Utils/const/color_const.dart';

Widget closeApp(BuildContext context) {
  return AlertDialog(
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Align(
            alignment: AlignmentDirectional.topEnd,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset(
                "assets/images/cross.png",
                width: 20,
                height: 20,
                fit: BoxFit.fill,
                color: black.withOpacity(0.6),
              ),
            ),
          ),
        ),
        const Text(
          "Are you sure?",
          style: TextStyle(
              color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          "Do you want to exit on app ?",
          style: TextStyle(color: Colors.black, fontSize: 15),
        ),
        const SizedBox(
          height: 15,
        ),
        ElevatedButton(
          onPressed: () {
            SystemNavigator.pop();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: white,
          ),
          child: Text(
            "Yes",
            style: TextStyle(
                color: black, fontSize: 15, fontWeight: FontWeight.bold),
          ),
        )
      ],
    ),
  );
}
