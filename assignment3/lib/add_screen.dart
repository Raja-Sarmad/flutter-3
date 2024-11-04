import 'package:flutter/material.dart';

class AddScreen extends StatefulWidget {
  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  String _priority = 'Medium';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text('Create new Task'),
            Spacer(),
            CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/dp.png'), // Profile image asset
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(labelText: 'From'),
                    onTap: () {},
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(labelText: 'To'),
                    onTap: () {},
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(labelText: 'Description'),
              maxLines: 3,
            ),
            SizedBox(height: 10),
            Text('Choose Priority'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: ['High', 'Medium', 'Low']
                  .map((priority) => ChoiceChip(
                        label: Text(priority),
                        selected: _priority == priority,
                        onSelected: (selected) {
                          setState(() {
                            _priority = priority;
                          });
                        },
                      ))
                  .toList(),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Add'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
