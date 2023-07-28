import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:translator_app/generated/l10n.dart';
import 'package:translator_app/provider/theme_provider.dart';


class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);


    return Scaffold(
      appBar: AppBar(
        title:  Text(S.of(context).settings),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Switch(
              onChanged: (value) {
                setState(() {
                  themeProvider.toggleTheme();
                });
              },
              value: !themeProvider.isLightTheme,
            ),
            const Text('Turn off to change to Dark mode'),
            const SizedBox(height: 10),
            
          ],
        ),
      ),
    );
  }

    
}
