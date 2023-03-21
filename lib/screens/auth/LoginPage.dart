import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interviewo/screens/auth/RegisterPage.dart';
import 'package:interviewo/services/NavigationService.dart';
import 'package:interviewo/utils/Locator.dart';
import 'package:interviewo/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool _passwordVisible = false;
  final _formKey = GlobalKey<FormState>();
  String? pageType;
  _saveLogin() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.setBool("isLoggedIn", true);
  }

  _getPageType() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      pageType = prefs.getString('pageType');
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final NavigationService _navigationService = locator<NavigationService>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  // Image(
                  //     image: const AssetImage('assets/cat.jpg'),
                  //     height: MediaQuery.of(context).size.height * 0.2),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.2),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Text("Login",
                        style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color: IOTheme().IOBlue)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text("For You, By Us",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: IOTheme().IOBlue)),
                  ),
                ],
              ),
              Form(
                key: _formKey,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: _name,
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: IOTheme().IOGreen)),
                          prefixIcon: Icon(Icons.email_outlined),
                          labelText: "Enter your Email",
                          floatingLabelStyle:
                              TextStyle(color: IOTheme().IOGreen),
                          prefixIconColor: IOTheme().IOGreen,
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: IOTheme().IOGreen)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: IOTheme().IOGreen)),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _password,
                        obscureText: !_passwordVisible,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(
                              // Based on passwordVisible state choose the icon
                              _passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: IOTheme().IOGreen,
                            ),
                            onPressed: () {
                              // Update the state i.e. toogle the state of passwordVisible variable
                              setState(() {
                                _passwordVisible = !_passwordVisible;
                              });
                            },
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: IOTheme().IOGreen)),
                          prefixIcon: Icon(Icons.password_outlined),
                          labelText: "Enter your Password",
                          floatingLabelStyle:
                              TextStyle(color: IOTheme().IOGreen),
                          prefixIconColor: IOTheme().IOBlue,
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: IOTheme().IOGreen)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: IOTheme().IOGreen)),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter valid password';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                            onPressed: () {},
                            child: Text("Forgot Password?",
                                style: TextStyle(
                                    color: IOTheme().IOBlue,
                                    fontWeight: FontWeight.bold))),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              fixedSize: Size(
                                  MediaQuery.of(context).size.width * 0.2, 50),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              backgroundColor:
                                  IOTheme().IOBlue.withOpacity(0.5)),
                          onPressed: () {
                            _formKey.currentState!.save();
                            if (_formKey.currentState!.validate()) {
                              _navigationService.navigateTo("/navSelect",
                                  arguments: {'pageType': pageType});
                            }
                          },
                          child: Text("LOGIN",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("OR",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: IOTheme().IOBlue)),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: OutlinedButton.icon(
                        icon: const Image(
                            image: AssetImage("assets/google.png"), height: 20),
                        onPressed: () {
                          _navigationService.navigateTo('/googleAuth');
                        },
                        style: OutlinedButton.styleFrom(
                            fixedSize: Size(
                                MediaQuery.of(context).size.width * 0.2, 50),
                            backgroundColor: IOTheme().IOBlue.withOpacity(0.5),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        label: const Text("Signin With Google",
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  TextButton(
                    onPressed: () {
                      _navigationService.navigateTo("/register");
                    },
                    child: Text.rich(
                      TextSpan(
                          text: "Don't have an account?",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: IOTheme().IOBlue),
                          children: [
                            TextSpan(
                                text: " \tSignup",
                                style: TextStyle(color: IOTheme().IOBlue))
                          ]),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
