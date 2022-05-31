import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Attendance extends StatefulWidget {
  const Attendance({Key? key}) : super(key: key);

  @override
  State<Attendance> createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {
  // //////
  // static const orange = Color(0xFFFE9A75);
  // static const dark = Color(0xFF333A47);
  // static const double leftPadding = 50;

  // final _defaultTimeRange = TimeRangeResult(
  //   TimeOfDay(hour: 7, minute: 30),
  //   TimeOfDay(hour: 18, minute: 30),
  // );
  // TimeRangeResult? _timeRange;
  ///
  final TextEditingController _nikCont = TextEditingController();
  final TextEditingController _namaCont = TextEditingController();

  DateTime dateTimeKegiatan = DateTime(2022, 05, 24, 5, 30);
  DateTime dateTimeDeadline = DateTime(2022, 06, 12, 5, 30);

  TimeOfDay harusnyaMasuk = const TimeOfDay(hour: 8, minute: 30);
  TimeOfDay harusnyaPulang = const TimeOfDay(hour: 17, minute: 30);

  String? nik;
  String? nama;
  String? tanggal;
  String? jamMasuk;
  String? jamPulang;
  String? telat;
  String? pulangAwal;

  TimeOfDay startWorking = const TimeOfDay(hour: 08, minute: 30);
  TimeOfDay stopWorking = const TimeOfDay(hour: 17, minute: 30);

  @override
  Widget build(BuildContext context) {
    final hoursAwal = dateTimeKegiatan.hour.toString().padLeft(2, '0');
    final minutesAwal = dateTimeKegiatan.minute.toString().padLeft(2, '0');
    final hoursFinal = dateTimeDeadline.hour.toString().padLeft(2, '0');
    final minutesFinal = dateTimeDeadline.minute.toString().padLeft(2, '0');

    var time1 = hoursAwal + minutesAwal;
    var time2 = hoursFinal + minutesFinal;
    var timeX = "08:30";
    var timeY = "17:30";

    Future<int> getDifference(String time1, String timeX) async {
      DateFormat dateFormat = DateFormat("yyyy-MM-dd");

      var _date = dateFormat.format(DateTime.now());

      DateTime a = DateTime.parse('$_date $time1:00');
      DateTime b = DateTime.parse('$_date $timeX:00');

      print('a $a');
      print('b $b');

      print("${a.difference(b).inMinutes}");

      return a.difference(b).inMinutes;
    }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _nikCont,
                  style: const TextStyle(fontSize: 18),
                  decoration: const InputDecoration(
                    labelText: 'NIK',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _namaCont,
                  style: const TextStyle(fontSize: 18),
                  decoration: const InputDecoration(
                    labelText: 'Nama Karyawan',
                  ),
                ),
              ),
              const Text('Tanggal Hari Ini'),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width / 1.1,
                  child: ElevatedButton(
                      onPressed: () async {
                        final dateTimeKegiatanAwal = await pickDate();
                        if (dateTimeKegiatanAwal == null) {
                          return;
                        } //buat cancel kalo null
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                            setState(() {
                              dateTimeKegiatan = newKegiatanAwal;
                            });
                          },
                          child: const Text('Waktu Masuk'))),
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
                            setState(() {
                              dateTimeDeadline = newKegiatanAkhir;
                            });
                          },
                          child: const Text('Waktu Pulang'))),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width / 1.1,
                  child: ElevatedButton(
                      onPressed: () {
                        getDifference(time1, time2);
                        setState(() {
                          nik = _nikCont.text;
                          nama = _namaCont.text;
                          tanggal = dateTimeKegiatan.toString();
                        });
                      },
                      child: const Text('Submit'))),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Table(
                    border: TableBorder.all(),
                    children: [
                      buildRow([
                        'NIK',
                        'Nama',
                        'Tanggal',
                        'Jam Masuk',
                        'Jam Pulang',
                        'Telat',
                        'Pulang Awal'
                      ]),
                      buildRow([
                        nik.toString(),
                        nama.toString(),
                        DateFormat('yyyy-MM-dd').format(dateTimeKegiatan),
                        '$hoursAwal:$minutesAwal',
                        '$hoursFinal:$minutesFinal',
                        telat.toString(),
                        pulangAwal.toString()
                      ]),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  TableRow buildRow(List<String> cells) => TableRow(
      children: cells
          .map((cells) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(child: Text(cells)),
              ))
          .toList());

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
