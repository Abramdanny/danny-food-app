import 'package:flutter/material.dart';
import 'package:flutter_demo_firebase/colors.dart';
import 'constants.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  String _email, _password;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: true,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Image.asset(
                      bgImage,
                      height: height * 0.40,
                      width: width,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      height: height * 0.40,
                      width: width,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              stops: [0.3, 0.8],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Colors.transparent, Colors.white])),
                      // color: Colors.orange.withOpacity(0.3),
                    ),
                    Positioned(
                      bottom: 10,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black),
                                text: appName + "\n",
                                children: [
                                  TextSpan(
                                      text: slogan,
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 13))
                                ])),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 20),
                  child: Container(
                    child: Text(
                      "  $loginString  ",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          primaryColor.withOpacity(0.3),
                          Colors.transparent
                        ],
                      ),
                      border: Border(
                        left: BorderSide(color: primaryColor, width: 5),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    onSaved: (value) {
                      _email = value;
                    },
                    validator: (email) {
                      if (email.isEmpty) {
                        return "please Enter Email";
                      } else if (!RegExp(
                              r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                          .hasMatch(email)) return "Its Not a valid Email";
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: primaryColor)),
                      prefixIcon: Icon(Icons.email, color: primaryColor),
                      labelText: "EMAIL ADDRESS",
                      labelStyle: TextStyle(color: primaryColor, fontSize: 16),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 10),
                  child: TextFormField(
                    onSaved: (value) {
                      _password = value;
                    },
                    validator: (password) {
                      if (password.isEmpty)
                        return "Please Enter Password";
                      else if (password.length < 8 || password.length > 15)
                        return "Password Length is Incorrect";
                      return null;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: primaryColor)),
                      prefixIcon: Icon(Icons.lock_open, color: primaryColor),
                      labelText: "PASSWORD",
                      labelStyle: TextStyle(color: primaryColor, fontSize: 16),
                    ),
                  ),
                ),
                Align(
                    alignment: Alignment.centerRight,
                    child:
                        FlatButton(onPressed: () {}, child: Text(forgetText))),
                Center(
                  child: SizedBox(
                    height: height * 0.08,
                    width: width - 30,
                    child: FlatButton(
                      color: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      onPressed: () {
                        if (formkey.currentState.validate()) {
                          formkey.currentState.save();
                          if (_email == "test@gmail.com" &&
                              _password == "root@123") {
                            FocusScope.of(context).unfocus();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomeScreen(),
                              ),
                            );
                          } else {
                            print("Invalid Login Details");
                          }
                        }
                      },
                      child: Text(
                        "Login to account",
                        style: TextStyle(
                            letterSpacing: 0.5,
                            fontWeight: FontWeight.w500,
                            fontSize: 22,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Dont' have an account?"),
                    FlatButton(
                        onPressed: () {},
                        child: Text(
                          "Create Account",
                          style: TextStyle(color: primaryColor, fontSize: 16),
                        ))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
