import 'package:flutter/material.dart';
import 'package:kfc_project/colors.dart';
import 'package:kfc_project/dimensions.dart';
import 'package:kfc_project/pages/mainPage.dart';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:kfc_project/providers/theme_providers.dart';
import 'package:kfc_project/spacing.dart';
import 'package:kfc_project/widget/my_appBar.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  ThemeMode dayNightToggleValue = ThemeMode.light;
  final List<String> drawerOption = [
    "About us",
    "Feedback",
    "Privacy Policy",
    "Terms and Condition",
    "Contact us",
    "Mitao Bhook",
    "Careers"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: Drawer(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(Dimension.paddingMedium),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ElevatedButton(onPressed: () {}, child: const Text("Login")),
                spacing.largeY,
                Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                    height: 40,
                    width: 96,
                    child: AnimatedToggleSwitch<ThemeMode>.dual(
                      current:
                          Provider.of<ThemeProvider>(context).getThemeMode(),
                      first: ThemeMode.light,
                      second: ThemeMode.dark,
                      style: const ToggleStyle(
                          backgroundColor: AppColor.brandColor,
                          indicatorColor: Colors.white,
                          borderColor: AppColor.brandColor,
                          borderRadius: BorderRadius.all(
                              Radius.circular(Dimension.borderRadiusSmall))),
                      textBuilder: (value) {
                        return value == ThemeMode.light
                            ? const Text(
                                "Day",
                                style: TextStyle(color: Colors.white),
                              )
                            : const Text("Night",
                                style: TextStyle(color: Colors.white));
                      },
                      iconBuilder: (value) {
                        return value == ThemeMode.light
                            ? const Icon(
                                Icons.sunny,
                                color: AppColor.brandColor,
                              )
                            : const Icon(
                                Icons.nightlight,
                                color: AppColor.brandColor,
                              );
                      },
                      onChanged: (value) {
                        Provider.of<ThemeProvider>(context, listen: false)
                            .Toggle();
                      },
                    ),
                  ),
                ),
                spacing.smallY,
                const Divider(),
                spacing.smallY,
                ListTile(
                  leading: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          color: AppColor.brandColor,
                          borderRadius: BorderRadius.circular(
                              Dimension.borderRadiusSmall)),
                      child: const Icon(
                        Icons.pin_drop,
                        color: Colors.white,
                      )),
                  title: const Text("STORE LOCATOR"),
                ),
                ListTile(
                  leading: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          color: AppColor.brandColor,
                          borderRadius: BorderRadius.circular(
                              Dimension.borderRadiusSmall)),
                      child: const Icon(
                        Icons.search,
                        color: Colors.white,
                      )),
                  title: const Text("TRACK ORDER"),
                ),
                ListTile(
                  leading: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          color: AppColor.brandColor,
                          borderRadius: BorderRadius.circular(
                              Dimension.borderRadiusSmall)),
                      child: const Icon(
                        Icons.list,
                        color: Colors.white,
                      )),
                  title: const Text("EXPLORE MENU"),
                ),
                spacing.smallY,
                const Divider(),
                spacing.smallY,
                for (int i = 0; i < drawerOption.length; i++)
                  SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () {},
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(drawerOption[i]),
                      ),
                    ),
                  )
              ],
            ),
          ),
        ),
      ),
      body: const mainPage(),
    );
  }
}
