import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:translator_app/ui/screens/view.dart';


class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  static final List<Widget> _navScreens = <Widget>[
    const HomeScreen(),
     FavoritesScreen(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _navScreens.elementAt(_selectedIndex),),
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
          child: GNav(
            backgroundColor: Colors.black,
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Color.fromARGB(255, 73, 71, 71),
            gap: 8,
            tabs: const [
              GButton(icon: Icons.translate_outlined, text: 'Переводчик'),
              GButton(icon: Icons.history, text: 'История'),
              GButton(icon: Icons.settings, text: 'Настройки'),
            ],
            selectedIndex: _selectedIndex,
            onTabChange: (index){
              setState(() {
                _selectedIndex = index;    
              });
            },
          ),
        ),
      ),
    );
  }
}
