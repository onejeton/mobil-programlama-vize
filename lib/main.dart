import 'package:flutter/material.dart';

// Pages
import 'uyeOl.dart';
import 'sifremiUnuttum.dart';
import 'anasayfa.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Login(),
        '/register': (context) => Register(),
        '/lostpassword': (context) => Lostpassword(),
        '/anasayfa': (context) => Homepage()
      },
    );
  }
}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String _username;
  String _password;

  final _values = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _values,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MaterialButton(
                    child: Text('Şifremi Unuttum'),
                    onPressed: () {
                      Navigator.pushNamed(context, '/lostpassword');
                    },
                  ),
                  MaterialButton(
                    child: Text('Üye Ol'),
                    onPressed: () {
                      Navigator.pushNamed(context, '/register');
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
              Container(
                child: RaisedButton(
                  child: Text('Giriş Yap'),
                  onPressed: () {
                    _values.currentState.save();

                    if (_username == "demo" || _password == "demo") {
                      Navigator.pushNamed(context, '/anasayfa');
                    } else {
                      debugPrint('Hata: Kullanıcı adı veya şifre hatalı');
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
