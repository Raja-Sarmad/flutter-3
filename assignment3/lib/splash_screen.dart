import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 3, 92, 92),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/dp.png', height: 200), 

            SizedBox(height: 20),
            Text(
              'Manage your Daily TO DO',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            
            SizedBox(height: 10),
            Text(
              'Without much worry just manage things as easy as a piece of cake',
              textAlign: TextAlign.center,
              style: TextStyle(color: const Color.fromARGB(179, 146, 201, 218)),
            ),
            
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
              style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 54, 227, 240)),
              child: Text('Create a Note'),
            ),
          ],
        ),
      ),
    );
  }
}
