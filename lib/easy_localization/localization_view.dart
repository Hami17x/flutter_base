import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LocalizationWidget extends StatefulWidget {
  const LocalizationWidget({Key? key}) : super(key: key);

  @override
  State<LocalizationWidget> createState() => _LocalizationWidgetState();
}

class _LocalizationWidgetState extends State<LocalizationWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("localization"),
      ),
      body: Column(
        children: [
          Text("hello").tr(),
          ElevatedButton(
              onPressed: () {
                context.setLocale(Locale("en", "US"));
              },
              child: Text("english")),
          ElevatedButton(
              onPressed: () {
                context.setLocale(Locale("tr", "TR"));
              },
              child: Text("türkçe")),
          ElevatedButton(
              onPressed: () {
                context.resetLocale();
              },
              child: Text("system")),
        ],
      ),
    );
  }
}
