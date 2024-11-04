import 'package:flutter/material.dart';
import 'package:myapp/home.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

TextEditingController nameController = TextEditingController();

class _DashboardViewState extends State<DashboardView> {
  List chats = [
    {
      "name": "Rimsha",
      'image':
          'https://cdn.pixabay.com/photo/2016/02/13/13/11/oldtimer-1197800_640.jpg',
      'lastMessage': 'hellloooooooo',
      'messageTime': '',
      'status': '',
      'notificationCount': '',
    },
    {
      "name": "Sana",
      'image':
          'https://cdn.pixabay.com/photo/2016/03/11/02/08/speedometer-1249610_640.jpg',
      'lastMessage': 'helllooo123',
      'messageTime': '',
      'status': '',
      'notificationCount': '',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.tealAccent,
        // leading: const Text("data"),
        title: const Text("ABC"),
        actions: const [Text("ABC"), Text("ABC")],
      ),
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeView(),
                ),
              );
            },
            tileColor: Colors.lightBlue,
            leading: CircleAvatar(
              backgroundImage: NetworkImage(chats[index]['image']),
            ),
            title: Text("${chats[index]['name']}"),
            subtitle: const Text("helllooo.........."),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                    onPressed: () {
                      var name = chats[index]['name'];
                      chats[index]['name'] = "$name updated";
                      setState(() {});

                      print(chats[index]);
                      nameController = chats[index]['name'];
                    },
                    icon: Icon(Icons.edit)),
              ],
            ),
          );
        },
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            // DrawerHeader(
            //   decoration: BoxDecoration(color: Colors.red),
            //   child: Text("data"),
            // ),
            const UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://cdn.pixabay.com/photo/2018/07/01/20/01/dashboard-3510327_1280.jpg'),
              ),
              accountName: Text("codewithowais"),
              accountEmail: Text("codewithowais@gmail.com"),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeView(),
                  ),
                );
              },
              title: const Text('Home'),
            ),
            const ListTile(
              title: Text('About'),
            ),
            const ListTile(
              title: Text('Contact'),
            ),
            const ListTile(
              title: Text('Profile'),
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     chats.add({
      //        "name": "Rimsha ${chats.length + 1}",
      // "image": "https://images.pexels.com/photos/1779487/pexels-photo-1779487.jpeg?cs=srgb&dl=pexels-designecologist-1779487.jpg&fm=jpg",
      // "lastmsg": "",
      // "msgTime": "",
      // "status": "",
      // "notificationCount": "",
      //     });
      //     setState(() {});
      //     print(chats);
      //     },
      //      child: Icon(Icons.add),
      //     ),
    );
  }
}
