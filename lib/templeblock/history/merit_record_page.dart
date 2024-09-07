import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'bean/merit_record.dart';

class MeritRecordPage extends StatelessWidget {
  final List<MeritRecord> recordList;
  final DateFormat format = DateFormat('yyyy年MM月dd日 HH:mm:ss');

  MeritRecordPage({super.key, required this.recordList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      /*body: ListView(
        children:
            List.generate(recordList.length, (index) => _buildListItem(index)),
      ),*/
      body: ListView.builder(
        itemBuilder: (context, index) => _buildListItem(index),
        itemCount: recordList.length,
      ),
    );
  }

  Widget _buildListItem(int index) {
    MeritRecord meritRecord = recordList[index];
    String date = format
        .format(DateTime.fromMillisecondsSinceEpoch(meritRecord.timestamp));
    return ListTile(
      leading: Image.asset(meritRecord.image),
      title: Text('功德 +${meritRecord.addMeritCount}'),
      subtitle: Text(meritRecord.sound),
      trailing: Text(
        date,
        style: const TextStyle(fontSize: 12, color: Colors.grey),
      ),
    );
  }

  /// 标题栏
  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      titleTextStyle: const TextStyle(
          color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
      iconTheme: const IconThemeData(color: Colors.black),
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: Colors.black)),
      title: const Text("功德记录"),
      centerTitle: true,
    );
  }
}
