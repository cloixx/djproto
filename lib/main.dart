import 'package:flutter/material.dart';
import 'package:djproto/songlist.dart';

final Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: SongListBuilder(),
        ),
      ),
    );
  }
}

class SongListBuilder extends StatelessWidget {
  const SongListBuilder({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var numItems = songId.length;
    const _titleFont = TextStyle(fontSize: 18.0);
    const _subtitleFont = TextStyle(fontSize: 14.0);
    void _showResult() => print('Поставлен в очередь!!!');

    Widget _buildRow(int idx) {
      return ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Text('${songId.elementAt(idx - 1)}'),
        ),
        title: Text(
          '${songName[songId.elementAt(idx - 1)]}',
          style: _titleFont,
        ),
        subtitle: Text(
          '${artists[songId.elementAt(idx - 1)]}',
          style: _subtitleFont,
        ),
        trailing:
            ElevatedButton(onPressed: _showResult, child: Text('В чергу!')),
      );
    }

    return ListView.builder(
      itemCount: numItems * 2,
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (BuildContext context, int i) {
        if (i.isOdd) return const Divider();
        final index = i ~/ 2 + 1;
        return _buildRow(index);
      },
    );
  }
}