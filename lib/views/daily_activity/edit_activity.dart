// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:projectkb/services/services.dart';

class EditActivity extends StatefulWidget {
  EditActivity({Key? key, required this.seq}) : super(key: key);

  @override
  State<EditActivity> createState() => _EditActivityState();
  String? seq;
}

class _EditActivityState extends State<EditActivity> {
  final TextEditingController _remarksCont = TextEditingController();
  final TextEditingController _activityCont = TextEditingController();
  DateTime dateTimeKegiatan = DateTime(2022, 05, 24, 5, 30);
  DateTime dateTimeDeadline = DateTime(2022, 06, 12, 5, 30);

  String? status = 'P';

  bool isOnProgress = true;
  bool isDone = false;

  @override
  Widget build(BuildContext context) {
    final hoursAwal = dateTimeKegiatan.hour.toString().padLeft(2, '0');
    final minutesAwal = dateTimeKegiatan.minute.toString().padLeft(2, '0');
    final hoursFinal = dateTimeDeadline.hour.toString().padLeft(2, '0');
    final minutesFinal = dateTimeDeadline.minute.toString().padLeft(2, '0');
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('SEQ'),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width / 1.1,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.grey),
                        onPressed: () {},
                        child: Text(widget.seq.toString()))),
                const SizedBox(
                  height: 16,
                ),
                const Text('Status'),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width / 3,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: (isDone == true)
                                    ? Colors.amber
                                    : Colors.grey),
                            onPressed: () {
                              setState(() {
                                isDone = true;
                                isOnProgress = false;
                                status = 'D';
                              });
                            },
                            child: const Text('Done'))),
                    SizedBox(
                        width: MediaQuery.of(context).size.width / 3,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: (isOnProgress == true)
                                    ? Colors.amber
                                    : Colors.grey),
                            onPressed: () {
                              setState(() {
                                isDone = false;
                                isOnProgress = true;
                                status = 'P';
                              });
                            },
                            child: const Text('On Progress'))),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text('Tanggal kegiatan'),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width / 1.1,
                    child: ElevatedButton(
                        onPressed: () async {
                          final dateTimeKegiatanAwal = await pickDate();
                          if (dateTimeKegiatanAwal == null)
                            return; //buat cancel kalo null
                          final newDateTime = DateTime(
                              dateTimeKegiatanAwal.year,
                              dateTimeKegiatanAwal.month,
                              dateTimeKegiatanAwal.day,
                              dateTimeKegiatan.hour,
                              dateTimeKegiatan.minute);
                          setState(() => dateTimeKegiatan = newDateTime);
                        },
                        child: Text(
                            '${dateTimeKegiatan.year} - ${dateTimeKegiatan.month} - ${dateTimeKegiatan.day}'))),
                const SizedBox(
                  height: 16,
                ),
                const Text('Waktu kegiatan mulai dan selesai'),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width / 3,
                        child: ElevatedButton(
                            onPressed: () async {
                              final waktuAwal = await pickTime();
                              if (waktuAwal == null) return;
                              final newKegiatanAwal = DateTime(
                                dateTimeKegiatan.year,
                                dateTimeKegiatan.month,
                                dateTimeKegiatan.hour,
                                waktuAwal.hour,
                                waktuAwal.minute,
                              );
                              setState(
                                  () => dateTimeKegiatan = newKegiatanAwal);
                            },
                            child: Text('$hoursAwal:$minutesAwal'))),
                    const SizedBox(
                      height: 16,
                      child: Text('Sampai Dengan'),
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width / 3,
                        child: ElevatedButton(
                            onPressed: () async {
                              final waktuAkhir = await pickDeadlineTime();
                              if (waktuAkhir == null) return;
                              final newKegiatanAkhir = DateTime(
                                dateTimeDeadline.year,
                                dateTimeDeadline.month,
                                dateTimeDeadline.day,
                                waktuAkhir.hour,
                                waktuAkhir.minute,
                              );
                              setState(
                                  () => dateTimeDeadline = newKegiatanAkhir);
                            },
                            child: Text('$hoursFinal:$minutesFinal'))),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text('Tanggal Deadline'),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width / 1.1,
                    child: ElevatedButton(
                        onPressed: () async {
                          final dateTimeKegiatanAkhir = await pickDate();
                          if (dateTimeKegiatanAkhir == null)
                            return; //buat cancel kalo null
                          final newDateTimeAkhir = DateTime(
                              dateTimeKegiatanAkhir.year,
                              dateTimeKegiatanAkhir.month,
                              dateTimeKegiatanAkhir.day,
                              dateTimeDeadline.hour,
                              dateTimeDeadline.minute);
                          setState(() => dateTimeDeadline = newDateTimeAkhir);
                        },
                        child: Text(
                            '${dateTimeDeadline.year} - ${dateTimeDeadline.month} - ${dateTimeDeadline.day}'))),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width / 1,
                          height: MediaQuery.of(context).size.height / 6,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              controller: _remarksCont,
                              maxLines: 10,
                              keyboardType: TextInputType.multiline,
                              decoration: const InputDecoration.collapsed(
                                hintText: 'Your Remarks Here',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width / 1,
                          height: MediaQuery.of(context).size.height / 6,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              controller: _activityCont,
                              maxLines: 10,
                              keyboardType: TextInputType.multiline,
                              decoration: const InputDecoration.collapsed(
                                hintText: 'Your Remarks Here',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width / 1.1,
                    child: ElevatedButton(
                        // style: ElevatedButton.styleFrom(primary: Colors.grey),
                        onPressed: () {
                          ServicesAPI().postUpdateActivity(
                              widget.seq.toString(),
                              dateTimeKegiatan.toString(),
                              hoursAwal.toString(),
                              hoursFinal.toString(),
                              dateTimeDeadline.toString(),
                              _activityCont.text.trim(),
                              _remarksCont.text.trim(),
                              status);
                        },
                        child: const Text('Submit'))),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<DateTime?> pickDate() => showDatePicker(
      context: context,
      initialDate: dateTimeKegiatan,
      firstDate: DateTime(2000),
      lastDate: DateTime(2099));

  Future<TimeOfDay?> pickTime() => showTimePicker(
      context: context,
      initialTime: TimeOfDay(
          hour: dateTimeKegiatan.hour, minute: dateTimeKegiatan.minute));

  Future<TimeOfDay?> pickDeadlineTime() => showTimePicker(
      context: context,
      initialTime: TimeOfDay(
          hour: dateTimeDeadline.hour, minute: dateTimeDeadline.minute));
}
