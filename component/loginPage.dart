import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:flutter_application_1/features/auth/registeration/view/component/forget_password.dart';
import 'package:flutter_application_1/features/auth/registeration/view/component/Auth_print.dart';



class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  final LocalAuthentication _localAuth = LocalAuthentication();

  void signUserIn() {
    // Your login logic here
  }

  Future<void> authenticateWithFingerprint(BuildContext context) async {
  try {
    // Authenticate using local_auth package
    final LocalAuthentication _localAuth = LocalAuthentication();
    bool isAuthenticated = await _localAuth.authenticate(
      localizedReason: 'Authenticate to login', // Reason for authentication
    
    );

    if (isAuthenticated) {
      // Navigate to the authenticated page or perform desired action
    } else {
      // If authentication fails, show a message to the user
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Authentication Failed'),
          content: Text('Fingerprint authentication failed. Please try again.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  } on PlatformException catch (e) {
    print('Error: ${e.message}');
    // Handle platform-specific errors, if any
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 50),
              Text(
                'Welcome back to login page!',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 25),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 100, 150, 220),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 232, 126, 162),
                      ),
                    ),
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    hintText: 'Username',
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 232, 126, 162),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 128, 127, 127),
                      ),
                    ),
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    hintText: 'Password',
                  ),
                  obscureText: true,
                  obscuringCharacter: "*",
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ForgotPassPage(),
                          ),
                        );
                      },
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(
                          color: Color.fromARGB(255, 232, 126, 162),
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25),
              ElevatedButton(
                onPressed: () => signUserIn(),
                child: Text('Login'),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
               children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FingerprintAuthPage()),
                  );
                },
                child: Icon(
                  Icons.fingerprint,
                  size: 70,
                  color: Colors.blue, // Customize color as needed
                ),
              ),
              SizedBox(height: 20),
              Text('Tap the fingerprint icon to authenticate'),
            ],
              ),
          

            ],
          ),
        ),
      ),
    );
  }
}
