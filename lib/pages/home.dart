import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                margin: EdgeInsets.only(bottom: 16),
                child: Text(
                  '暂无服务器配置',
                  style: TextStyle(color: Colors.grey, fontSize: 32),
                )),
            ButtonTheme(
              minWidth: 160,
              child: RaisedButton(
                  child: Text(
                    '点击添加服务器',
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/connect');
                  }),
            )
          ],
        ),
      ),
    );
  }
}
