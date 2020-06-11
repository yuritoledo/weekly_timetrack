import 'package:flutter/material.dart';
import 'package:weekly_timetrack/models/daily_timer.dart';
import 'package:weekly_timetrack/pages/single_timer.dart';

class TracksList extends StatefulWidget {
  @override
  _TracksListState createState() => _TracksListState();
}

class _TracksListState extends State<TracksList> {
  List<DailyTimer> list = [];

  @override
  void initState() {
    super.initState();

    setState(() {
      feed();
    });
  }

  feed() {
    final dummyData = [
      DailyTimer(id: '1', starterHour: DateTime.now(), time: '00:30:00'),
      DailyTimer(id: '2', starterHour: DateTime.now(), time: '01:30:00'),
    ];
    setState(() {
      list = dummyData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List'),
        centerTitle: true,
      ),
      body: Container(
        child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            final item = list[index];
            return ListTile(
              title: Text(item.starterHourString),
              subtitle: Text(item.id),
              trailing: Icon(Icons.delete),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => SingleTimer(item),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
