// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectkb/model/activity_history_response.dart';
import 'package:projectkb/services/services.dart';
import 'package:intl/intl.dart';
import 'package:projectkb/views/daily_activity/edit_activity.dart';

class MelihatListKegiatan extends StatefulWidget {
  const MelihatListKegiatan({Key? key}) : super(key: key);

  @override
  State<MelihatListKegiatan> createState() => _MelihatListKegiatanState();
}

class _MelihatListKegiatanState extends State<MelihatListKegiatan> {
  bool isN = true;
  bool isD = false;
  bool isP = false;

  String? status = 'N';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Flexible(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isN = true;
                      isP = false;
                      isD = false;
                      status = 'N';
                    });
                  },
                  child: Text('N')),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isN = false;
                      isP = false;
                      isD = true;
                      status = 'D';
                    });
                  },
                  child: Text('D')),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isN = false;
                      isP = true;
                      isD = false;
                      status = 'P';
                    });
                  },
                  child: Text('P'))
            ],
          )),
          Flexible(
              flex: 10,
              child: FutureBuilder<ActivityHistoryResponse>(
                future: ServicesAPI().getActivityHistory(status.toString()),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  var historyData = snapshot.data;
                  if (!snapshot.hasData) {
                    return Center(
                      child: Container(),
                    );
                  } else {
                    return SafeArea(
                      child: ListView.builder(
                          itemCount: historyData.data.length,
                          itemBuilder: (context, index) {
                            if (historyData.data != null) {
                              return Padding(
                                padding: const EdgeInsets.all(12),
                                child: SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 2,
                                  child: Card(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(historyData.data[index].seq),
                                          Text(historyData.data[index].nik),
                                          Text(historyData
                                              .data[index].namaKaryawan),
                                          Text(
                                              historyData.data[index].namaHead),
                                          Text(historyData.data[index].kdDept),
                                          Text(historyData
                                              .data[index].department),
                                          Text(DateFormat('yyyy-MM-dd').format(
                                              historyData.data[index].actDate)),
                                          Text(DateFormat('yyyy-MM-dd').format(
                                              historyData
                                                  .data[index].deadline)),
                                          Text(historyData.data[index].timeIn),
                                          Text(historyData.data[index].timeOut),
                                          Text(historyData.data[index].status),
                                          Text(
                                              historyData.data[index].category),
                                          Text(
                                              historyData.data[index].activity),
                                          Text(historyData.data[index].remark),
                                          SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  1.1,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  20,
                                              child: ElevatedButton(
                                                  // style: ElevatedButton.styleFrom(primary: Colors.grey),
                                                  onPressed: () {
                                                    Get.to(() => EditActivity(
                                                        seq: historyData
                                                            .data[index].seq));
                                                  },
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: const [
                                                      Icon(
                                                        Icons.edit,
                                                        color: Colors.white,
                                                      ),
                                                      Text(
                                                        'Edit',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ],
                                                  ))),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            } else {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          }),
                    );
                  }
                },
              ))
        ],
      ),
    ));
  }
}
