import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function()? onTap;
  const MyButton({super.key, required this.onTap});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
       
          
            padding: EdgeInsets.all(25),
            margin: EdgeInsets.symmetric(horizontal: 25),
            decoration: BoxDecoration(
              color: Color.fromARGB(175, 6, 136, 10),
              borderRadius: BorderRadius.circular(25),
              
  
            ),
          child: Center(
                child: FittedBox(
                 fit: BoxFit.scaleDown,
                child: Text(
              'Login',
              overflow: TextOverflow.ellipsis, // Overflow handling
              maxLines: 1,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
    )))));
  }
}
