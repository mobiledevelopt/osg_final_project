import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:group09/view/ingredien.dart';
import 'package:group09/view/kategori.dart';

import 'model/Model_meals.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  // final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _jsonContent = "";
  int _selectedIndex = 0;
  Color gradient1 = const Color.fromRGBO(180, 35, 74, 1.0);
  Color gradient2 = const Color.fromRGBO(180, 35, 74, 1.0);
  Color gradient3 = const Color.fromRGBO(245, 127, 23, 1.0);

  Icon foodIcon = const Icon(
    Icons.fastfood,
    size: 50.0,
  );

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),

      Kategori()
    ,
      Ingredien()
    // Text(
    //   'Index 2: Ingredien',
    //   style: optionStyle,
    // ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: foodIcon,
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.people,
              color: Colors.white,
            ),
            onPressed: () {},
          )
        ],

        // untuk gradient background
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: <Color>[
                gradient1,
                gradient2,
                gradient3,
              ])),
        ),
      ),
      body: Container(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.black54,
        backgroundColor: Colors.red,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant_menu),
            title: Text("Beranda"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more),
            title: Text("Kategori"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.description),
            title: Text("Ingredien"),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  Future _loadSampleJson() async {
    String jsonString = await rootBundle.loadString("data/data_ingredien.json");
    final jsonData = json.decode(jsonString);
    Model_meals sample = Model_meals.fromJson(jsonData);
    setState(() {
      _jsonContent = sample.toString();
      // sample.name => you can access field from class model
    });
  }
}
