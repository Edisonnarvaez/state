import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'State App with Color Change',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      home: const MyStatefulApp(),
    );
  }
}

class MyStatefulApp extends StatefulWidget {
  const MyStatefulApp({super.key});

  @override
  _MyStatefulAppState createState() => _MyStatefulAppState();
}

class _MyStatefulAppState extends State<MyStatefulApp> {
  int _selectedIndex = 0; 
  final List<Color> _colors = [Colors.yellow, Colors.blue, Colors.red];
  Color _currentColor = Colors.yellow;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('State App with Color Change'),
      ),
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBody() {
    switch (_selectedIndex) {
      case 0:
        return _buildHomeScreen();
      case 1:
        return _buildBusinessScreen();
      case 2:
        return _buildSchoolScreen();
      default:
        return Container();
    }
  }

  Widget _buildHomeScreen() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 100,
            height: 100,
            color: _currentColor,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _changeColor,
            child: const Text('Cambiar Color'),
          ),
        ],
      ),
    );
  }

  Widget _buildBusinessScreen() {
    return Center(
      child: Text(
        'Business',
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }

  Widget _buildSchoolScreen() {
    return Center(
      child: Text(
        'School',
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }

  void _changeColor() {
    setState(() {
      _currentColor = (_colors..shuffle()).first;
    });
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.business),
          label: 'Business',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.people),
          label: 'School',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.amber,
      onTap: (index) {
        setState(() {
          _selectedIndex = index;
        });
      },
    );
  }
}
