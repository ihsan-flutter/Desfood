import 'dart:async';
import 'dart:ui';
import 'package:desfoodd/anagovde.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


import 'Methods.dart';

import 'package:cool_alert/cool_alert.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(CreateAccount());
}

class CreateAccount extends StatelessWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Kayit_Iskele(),
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
    );
  }
}

class Kayit_Iskele extends StatefulWidget {
  const Kayit_Iskele({Key? key}) : super(key: key);

  @override
  _Kayit_IskeleState createState() => _Kayit_IskeleState();
}

class _Kayit_IskeleState extends State<Kayit_Iskele> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _name = TextEditingController();
  TextEditingController _surname = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var ekranbilgisi = MediaQuery.of(context);
    final double ekranyuksekligi = ekranbilgisi.size.height;
    final double ekrangenisligi = ekranbilgisi.size.width;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(),
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Colors.orange[900]!,
              Colors.orange[800]!,
              Colors.orange[400]!,
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: ekranyuksekligi / 15,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("KAYIT OL",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w600)),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(30),
                  child: SingleChildScrollView(
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 70,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(255, 95, 27, .3),
                                  blurRadius: 20,
                                  offset: Offset(0, 10),
                                ),
                              ],
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                    child: TextFormField(
                                      validator: (tfgirdisi) {
                                        //G??R??LEN VER??
                                        if (tfgirdisi!.isEmpty) {
                                          //BO??SA
                                          return "Ad Bo?? Ge??ilemez";
                                        }
                                        return null; //DE????LSE B????EY G??STERME
                                      },
                                      controller: _name,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        prefixIcon:
                                            Icon(Icons.account_circle_outlined),
                                        labelText: "Ad",
                                        labelStyle: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                        hintText: "Ad??n??z",
                                        hintStyle:
                                            TextStyle(color: Colors.grey),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                    child: TextFormField(
                                      validator: (tfgirdisi) {
                                        //G??R??LEN VER??
                                        if (tfgirdisi!.isEmpty) {
                                          //BO??SA
                                          return "Soyad Bo?? Ge??ilemez";
                                        }
                                        return null; //DE????LSE B????EY G??STERME
                                      },
                                      controller: _surname,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        prefixIcon:
                                            Icon(Icons.account_circle_outlined),
                                        labelStyle: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                        labelText: "Soyad",
                                        hintText: "Soyad??n??z",
                                        hintStyle:
                                            TextStyle(color: Colors.grey),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                    child: TextFormField(
                                      keyboardType: TextInputType.emailAddress,
                                      validator: (tfgirdisi) {
                                        if (tfgirdisi!.isEmpty) {
                                          return "Email Bo?? Ge??ilemez";
                                        }

                                        return tfgirdisi.contains("@")
                                            ? null
                                            : "Ge??erli Bir Email Giriniz";
                                      },
                                      controller: _email,
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.email_outlined),
                                        labelStyle: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                        labelText: "Email",
                                        hintText: "Emailiniz",
                                        hintStyle:
                                            TextStyle(color: Colors.grey),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                    child: TextFormField(
                                      validator: (tfgirdisi) {
                                        //G??R??LEN VER??
                                        if (tfgirdisi!.isEmpty) {
                                          //BO??SA
                                          return "??ifre Bo?? Ge??ilemez";
                                        } else if (tfgirdisi.length < 6) {
                                          return "??ifre En Az 6 Karakter Olmal??d??r";
                                        }
                                        return null; //DE????LSE B????EY G??STERME
                                      },
                                      onChanged: (val) {
                                        setState(() => _password =
                                            val as TextEditingController);
                                      },
                                      controller: _password,
                                      obscureText: true,
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.lock_outline),
                                        labelText: "??ifre",
                                        labelStyle: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                        hintText: "??ifre",
                                        hintStyle:
                                            TextStyle(color: Colors.grey),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 40),
                          Container(
                            height: 100,
                            width: ekrangenisligi,
                            margin: EdgeInsets.symmetric(horizontal: 50),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              //color: Colors.orange[900],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: ekrangenisligi / 3,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shadowColor: Colors.orange,
                                      elevation: 5,
                                      primary: Colors.orange[900],
                                    ),
                                    child: Text("KAYIT",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16)),
                                    onPressed: () {
                                      bool controlsonucu = formKey.currentState!
                                          .validate(); //??FLER??N DURUMUNU KONTROL ET
                                      if (controlsonucu == true) {
                                        if (_name.text.isNotEmpty &&
                                            _surname.text.isNotEmpty &&
                                            _email.text.isNotEmpty &&
                                            _password.text.isNotEmpty) {
                                          createAccount(
                                            _name.text,
                                            _surname.text,
                                            _email.text,
                                            _password.text,
                                          ).then((user) {
                                            if (user != null) {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (_) =>
                                                          AnaGovde()));
                                              print(
                                                  "Account Created Sucessfull");
                                              CoolAlert.show(
                                                backgroundColor: Colors.orange,
                                                context: context,
                                                type: CoolAlertType.success,
                                                title: "",
                                                text: 'KAYIT BA??ARILI',
                                                // autoCloseDuration: Duration(seconds: 3),
                                              );
                                            }
                                          });
                                        }
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
