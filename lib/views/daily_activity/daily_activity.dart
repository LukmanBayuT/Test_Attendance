import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectkb/views/daily_activity/melihat_list_kegiatan.dart';
import 'package:projectkb/views/daily_activity/membuat_list_kegiatan.dart';

class DailyActivity extends StatefulWidget {
  const DailyActivity({Key? key}) : super(key: key);

  @override
  State<DailyActivity> createState() => _DailyActivityState();
}

class _DailyActivityState extends State<DailyActivity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
                flex: 1,
                child: Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 1.2,
                    height: MediaQuery.of(context).size.height / 8,
                    child: const Text('Kamu adalah 87654321'),
                  ),
                )),
            Flexible(
                flex: 1,
                child: Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 1.2,
                    height: MediaQuery.of(context).size.height / 8,
                    child: ElevatedButton(
                        onPressed: () {
                          Get.to(() => const MelihatListKegiatan());
                        },
                        child: const Text('Melihat List Kegiatan')),
                  ),
                )),
            Flexible(
                flex: 1,
                child: Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 1.2,
                    height: MediaQuery.of(context).size.height / 8,
                    child: ElevatedButton(
                        onPressed: () {
                          Get.to(() => const MembuatListKegiatan());
                        },
                        child: const Text('Membuat New List')),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
