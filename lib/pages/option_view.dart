import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class OptionView extends StatefulWidget {
  const OptionView({Key? key}) : super(key: key);

  @override
  State<OptionView> createState() => _OptionViewState();
}

class _OptionViewState extends State<OptionView> {
  int deger = 1;
  int deger2 = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("options"),
      ),
      body: Column(
        children: [
          ListTile(
            title: const Text("Theme"),
            trailing: SizedBox(
              width: 150,
              child: DropdownButton<String>(
                  value: context.watch<ThemeProvider>().currentTheme,
                  isExpanded: true,
                  items: const [
                    DropdownMenuItem(value: "Dark", child: Text("Dark Theme")),
                    DropdownMenuItem(
                        value: "Light", child: Text("Light Theme")),
                    DropdownMenuItem(value: "System", child: Text("System"))
                  ],
                  onChanged: (value) {
                    if (value == "Dark") {
                      context.read<ThemeProvider>().changeTheme("Dark");
                    } else if (value == "Light") {
                      context.read<ThemeProvider>().changeTheme("Light");
                    } else if (value == "System") {
                      context.read<ThemeProvider>().changeTheme("System");
                    }
                  }),
            ),
          ),
          ListTile(
            title: const Text("Language"),
            trailing: SizedBox(
              width: 150,
              child: DropdownButton<int>(
                  value: deger2,
                  isExpanded: true,
                  items: [
                    DropdownMenuItem(value: 1, child: Text("Turkish".tr())),
                    DropdownMenuItem(value: 2, child: Text("English".tr())),
                    DropdownMenuItem(
                        value: 3,
                        child: Text("System".tr() +
                            " " +
                            context.deviceLocale
                                .toStringWithSeparator(separator: ".")))
                  ],
                  onChanged: (value) {
                    if (value == 1) {
                      context.setLocale(Locale("tr", "TR"));
                    } else if (value == 2) {
                      context.setLocale(Locale("en", "US"));
                    } else if (value == 3) {
                      context.resetLocale();
                    }

                    deger2 = value!;
                    setState(() {});
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
