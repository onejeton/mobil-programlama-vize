import 'package:flutter/material.dart';

class Lostpassword extends StatelessWidget {
  final _values = GlobalKey<FormState>();

  String _email;

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
                        border: OutlineInputBorder(), labelText: 'Email'),
                    onSaved: (value) {
                      _email = value;
                    },
                  ),
                ),
                SizedBox(height: 20),
                RaisedButton(
                  child: Text('Gönder'),
                  onPressed: () {
                    _values.currentState.save();
                    debugPrint('Email : $_email');
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
