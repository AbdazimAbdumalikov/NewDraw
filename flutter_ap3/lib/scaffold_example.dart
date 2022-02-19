import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class ScaffoldExample extends StatefulWidget {
  const ScaffoldExample({Key? key}) : super(key: key);

  @override
  _ScaffoldExampleState createState() => _ScaffoldExampleState();
}

class _ScaffoldExampleState extends State<ScaffoldExample> {
  int tabIndex = 0;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  PersistentBottomSheetController? _controller;

  void openDrawer() {
    scaffoldKey.currentState?.openDrawer();
  }

  void toggleBottomSheet() {
    if (_controller == null) {
      _controller = scaffoldKey.currentState?.showBottomSheet(
            (context) => Container(
            color: Colors.deepOrange,
            height: 200,
              child: Center(
                child: TextButton(
                  onPressed: openDrawer,
                  child: const Text('Open Drawer'),
            ),
          ),
        ),
      );
    } else {
      _controller?.close();
      _controller = null;
    }
  }

  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    Text('Home'),
    Text('Favorite'),
  ];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      key: scaffoldKey,

      appBar: AppBar(
        title: Text('Ты красавчик!'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.chat))
        ],
      ),

      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),

      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Column(
                children: [
                  DrawerHeader(
                    child: CircleAvatar(
                      backgroundImage: NetworkImage('https://pbs.twimg.com/profile_images/378800000132463777/9b9e8ff65c23e1cdf3efcf1512431922_400x400.jpeg'),
                      radius: 60,
                      backgroundColor: Colors.red,
                    ),
                  ),
                  ListTile(
                    title: Text('Home'),
                    leading: Icon(Icons.home),
                    trailing: Icon(Icons.arrow_forward),
                  ),
                  ListTile(
                    title: Text('Profile'),
                    leading: Icon(Icons.person),
                    trailing: Icon(Icons.arrow_forward),
                  ),
                  ListTile(
                    title: Text('Images'),
                    leading: Icon(Icons.image),
                    trailing: Icon(Icons.arrow_forward),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(onPressed: () {},
                        child: Text('Вход')
                    ),
                    ElevatedButton(onPressed: () {},
                        child: Text('Регистрация')
                    )
                  ]
              ),
            )
          ],
        )
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        elevation: 10,
        notchMargin: 8,
        clipBehavior: Clip.antiAlias,
        child: Container(
          child: BottomNavigationBar(
            elevation: 0,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'Favorite',
              )
            ],
            currentIndex: _selectedIndex,
            onTap: _onItemTap,
          ),
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: toggleBottomSheet
      ),

/*      bottomSheet: BottomSheet(
        builder: (context) => Container(
          color: Colors.blueAccent,
          height: 200,
          child: Center(
            child: Text('Bottom'),
          ),
        ),
        onClosing: () {},
      ),*/
    );
  }
}