import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:nas_files/models/config.dart';

const supportedProtocols = ['WebDAV', 'SFTP'];

class ConnectPage extends StatefulWidget {
  @override
  ConnectState createState() => ConnectState();
}

class ConnectState extends State<ConnectPage> {
  final _formKey = GlobalKey<FormState>();

  String _protocol = supportedProtocols[0];
  List<Host> _hosts = [Host(null, null)];
  String _username;
  String _password;

  void _submit() {
    if (_formKey.currentState.validate()) {
      //
      Navigator.pushNamed(context, '/files');
    }
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
          title: Text('登录'),
        ),
        body: Form(
            key: _formKey,
            child: Container(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '添加服务器',
                    textAlign: TextAlign.center,
                  ),
                  DropdownButtonFormField(
                    isExpanded: true,
                    items: supportedProtocols.map((protocol) {
                      return DropdownMenuItem<String>(value: protocol, child: Text(protocol));
                    }).toList(),
                    value: _protocol,
                    hint: Text('请选择一个远程协议'),
                    onChanged: (v) => {
                      this.setState(() {
                        _protocol = v;
                      })
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return '请选择';
                      }
                      return null;
                    },
                  ),
                  ..._hosts.map((host) {
                    final index = _hosts.indexOf(host);
                    return Row(children: <Widget>[
                      Expanded(
                          flex: 1,
                          child: TextFormField(
                              decoration: InputDecoration(
                                  hintText: index > 0 ? '请输入备用服务器地址' : '请输入服务器地址', labelText: index > 0 ? null : '地址'),
                              onChanged: (value) => {
                                    this.setState(() {
                                      host.host = value;
                                    })
                                  },
                              validator: (value) {
                                if (value.isEmpty) {
                                  return '不能为空';
                                }
                                return null;
                              })),
                      TextFormField(
                          inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                          keyboardType: TextInputType.number,
                          initialValue: '22',
                          decoration: InputDecoration(
                              hintText: index > 0 ? '请输入备用服务器端口' : '请输入服务器端口', labelText: index > 0 ? null : '端口'),
                          onChanged: (value) => {
                                this.setState(() {
                                  host.port = num.tryParse(value);
                                })
                              },
                          validator: (value) {
                            if (value.isEmpty) {
                              return '不能为空';
                            }
                            return null;
                          }),
                      _hosts.length > 1
                          ? IconButton(
                              icon: Icon(Icons.remove_circle_outline),
                              padding: EdgeInsets.only(left: 16),
                              color: Theme.of(context).errorColor,
                              onPressed: () {
                                this.setState(() {
                                  _hosts = List.from(_hosts).removeAt(index);
                                });
                              },
                            )
                          : null
                    ]);
                  }).toList(),
                  _hosts.length < 3
                      ? ButtonTheme(
                          minWidth: 120,
                          child: RaisedButton(
                            child: Text(
                              '添加服务器',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              setState(() {
                                _hosts = [..._hosts, Host()];
                              });
                            },
                          ),
                        )
                      : null,
                  TextFormField(
                    decoration: InputDecoration(hintText: '请输入用户名', labelText: '用户名'),
                    onChanged: (value) => {
                      this.setState(() {
                        _username = value;
                      })
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return '不能为空';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: InputDecoration(hintText: '请输入密码', labelText: '密码'),
                    onChanged: (value) => {
                      this.setState(() {
                        _password = value;
                      })
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return '不能为空';
                      }
                      return null;
                    },
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 16),
                    alignment: Alignment.center,
                    child: ButtonTheme(
                      minWidth: 160,
                      child: RaisedButton(
                        child: Text(
                          '连接服务器',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: _submit,
                      ),
                    ),
                  )
                ],
              ),
            )));
  }
}
