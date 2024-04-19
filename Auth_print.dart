import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';


class FingerprintAuthPage extends StatelessWidget {
  final LocalAuthentication _localAuth = LocalAuthentication();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fingerprint Authentication'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.fingerprint,
              size: 100,
              color: Colors.blue, // Customize color as needed
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                try {
                  bool isAuthenticated = await _localAuth.authenticate(
                    localizedReason: 'Authenticate to login',
                  );

                  if (isAuthenticated) {
                    // Authentication succeeded
                    Navigator.pop(context, true); // Pop the page and return true to indicate successful authentication
                  } else {
                    // Authentication failed
                    // You can handle this case if needed
                  }
                } on PlatformException catch (e) {
                  print('Error: ${e.message}');
                  // Handle platform-specific errors, if any
                }
              },
              child: Text('Authenticate with Fingerprint'),
            ),
          ],
        ),
      ),
    );
  }
}
