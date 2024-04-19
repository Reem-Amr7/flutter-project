import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/auth/registeration/view/component/loginPage.dart';
import 'package:flutter_application_1/features/auth/registeration/view/component/verification_page.dart';

class BottomNavWidget extends StatelessWidget {
  const BottomNavWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FilledButton(
            style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(
                    const Color.fromARGB(174, 5, 117, 9))),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => OTPPage()),
              );
            },
            child: Text("confirm")),
        SizedBox(height: 11),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Have an Account?",
             style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
             )
            ),
            InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  child: const Text("Login",
                      style: TextStyle(
                        color:Color.fromARGB(174, 5, 117, 9),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
              
              
                      )),
                )),
          ],
        ),
      ],
    );
  }
}
