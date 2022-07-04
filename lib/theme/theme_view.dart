import 'package:flutter/material.dart';
import 'package:flutter_base/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class ThemeView extends StatefulWidget {
  const ThemeView({Key? key}) : super(key: key);

  @override
  State<ThemeView> createState() => _ThemeViewState();
}

class _ThemeViewState extends State<ThemeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Theme"),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                context.read<ThemeProvider>().changeTheme("Dark");
              },
              child: Text("dark theme")),
          ElevatedButton(
              onPressed: () {
                context.read<ThemeProvider>().changeTheme("Light");
              },
              child: Text("light theme")),
        ],
      ),
    );
  }
}
