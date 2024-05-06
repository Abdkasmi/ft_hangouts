import 'header.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int selectedIndex = 0;

  Map<int, GlobalKey<NavigatorState>> navigatorKeys = {
      0: GlobalKey<NavigatorState>(),
      1: GlobalKey<NavigatorState>(),
      2: GlobalKey<NavigatorState>()
  };

  final List<Widget> _widgetOptions = <Widget>[
    const ContactsPage(),
    const Chats(),
    const Settings()
  ];

  void onItemTap (int index) {
    setState(() {
      selectedIndex = index;
      print(selectedIndex);
    });
  }

  Navigator buildNavigator() {
     return Navigator(
       key: navigatorKeys[selectedIndex],
       onGenerateRoute: (RouteSettings settings){
         return MaterialPageRoute(builder: (_) => _widgetOptions.elementAt(selectedIndex));
       }   
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: buildNavigator(),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: selectedIndex,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
              BottomNavigationBarItem(icon: Icon(Icons.forum), label: 'chats'),
              BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'settings'),
            ],
            onTap: onItemTap,
          ),
      );
  }
}
