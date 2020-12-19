import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  String _email;
  String _username;
  String _password;
  String _rpassword;
  final _values = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Form(
            key: _values,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                    ),
                    onSaved: (value) {
                      _email = value;
                    },
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Kullanıcı Adı',
                    ),
                    onSaved: (value) {
                      _username = value;
                    },
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Şifre',
                    ),
                    onSaved: (value) {
                      _password = value;
                    },
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Şifre Tekrar',
                    ),
                    onSaved: (value) {
                      _rpassword = value;
                    },
                  ),
                ),
                SizedBox(height: 20),
                RaisedButton(
                  child: Text('Kayıt Ol'),
                  onPressed: () {
                    _values.currentState.save();

                    debugPrint(
                        'Email : $_email, Şifre : $_password, Tekrar Şifre : $_rpassword');
                    if (_password == _rpassword) {
                      Navigator.pushNamed(context, '/');
                    } else {
                      debugPrint('Şifre hatalı');
                    }
                  },
                ),
                SizedBox(height: 20),
                RaisedButton(
                  child: Text('Vazgeç '),
                  onPressed: () {
                    Navigator.pushNamed(context, '/');
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
