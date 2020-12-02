import 'package:flutter/material.dart';
import 'package:nas_files/models/file.dart';

class FilesPage extends StatefulWidget {
  @override
  FilesState createState() => FilesState();
}

class FilesState extends State<FilesPage> {
  List<File> _files = [];

  Widget _buildRow(BuildContext context, File file) {
    return ListTile(
      title: Text(file.name),
      isThreeLine: true,
      onTap: () {
        Navigator.pushNamed(context, '/detail');
      },
    );
  }

  @override
  void initState() {
    super.initState();
    // todo
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('文件管理'),
        ),
        body: ListView.builder(
          itemCount: _files.length * 2,
          itemBuilder: (context, index) {
            if (index.isOdd) return Divider();
            return _buildRow(context, _files[index ~/ 2]);
          },
        ));
  }
}
