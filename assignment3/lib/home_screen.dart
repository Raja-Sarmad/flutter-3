import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to Notes'),
        actions: [
          CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage('assets/checklist.png'), // Profile image asset
          ),
          SizedBox(width: 10),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Have a great Day\nMy Priority Task',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: _buildTaskCard('Mobile App UI Design', '2 hours ago'),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: _buildTaskCard('Capture Sunrise Shots', '4 hours ago'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'My Tasks',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView(
                children: [
                  _buildTaskItem('Complete Assignment', 'Due: 17 Sep'),
                  _buildTaskItem('Submit Fee Challan', 'Due: 18 Sep'),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add'); 
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildTaskCard(String title, String subtitle) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(subtitle),
          ],
        ),
      ),
    );
  }

  Widget _buildTaskItem(String title, String subtitle) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: Icon(Icons.more_vert),
    );
  }
}
