import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectkb/views/attendance/attendace.dart';
import 'package:projectkb/views/daily_activity/daily_activity.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(
              child: Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 1.5,
              height: MediaQuery.of(context).size.height / 6,
              child: ElevatedButton(
                  onPressed: () {
                    Get.to(() => const DailyActivity());
                  },
                  child: const Text('Daily Activity')),
            ),
          )),
          Flexible(
              child: Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 1.5,
              height: MediaQuery.of(context).size.height / 6,
              child: ElevatedButton(
                  onPressed: () {
                    Get.to(() => const Attendance());
                  },
                  child: const Text('Attendance')),
            ),
          ))
        ],
      ),
    );
  }
}
