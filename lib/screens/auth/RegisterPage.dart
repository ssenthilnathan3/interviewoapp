import 'package:flutter/material.dart';
import 'package:interviewo/services/NavigationService.dart';
import 'package:interviewo/utils/Locator.dart';
import 'package:interviewo/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _mobile = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _passwordVisible = false;
  String? pageType;
  _saveRegister() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.setBool("isRegistered", true);

    _prefs.setString("name", _name.text);
    _prefs.setString("email", _email.text);
    _prefs.setString("password", _password.text);
    _prefs.setString("mobile", _mobile.text);
  }

  _getPageType() async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    setState(() {
      pageType = _prefs.getString('pageType') ?? 'student';
    });
  }

  @override
  Widget build(BuildContext context) {
    final NavigationService _navigationService = locator<NavigationService>();

    return Stack(children: <Widget>[
      Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          padding: EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1),
                      Padding(
                        padding: const EdgeInsets.only(left: 14.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Register",
                              style: TextStyle(
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold,
                                  color: IOTheme.IOBlue)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Connect with Us!",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                        ),
                      ),
                    ],
                  ),
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
                                borderSide: BorderSide(color: IOTheme.IOGreen)),
                            prefixIcon: Icon(Icons.person_3_rounded),
                            labelText: "Enter your Name",
                            floatingLabelStyle:
                                TextStyle(color: IOTheme.IOGreen),
                            prefixIconColor: IOTheme.IOGreen,
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: IOTheme.IOGreen)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: IOTheme.IOGreen)),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your Name';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: _email,
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: IOTheme.IOGreen)),
                            prefixIcon: Icon(Icons.email_outlined),
                            labelText: "Enter your Email",
                            floatingLabelStyle:
                                TextStyle(color: IOTheme.IOGreen),
                            prefixIconColor: IOTheme.IOGreen,
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: IOTheme.IOGreen)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: IOTheme.IOGreen)),
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
                          controller: _mobile,
                          cursorColor: Colors.white,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: IOTheme.IOGreen)),
                            prefixIcon: Icon(Icons.email_outlined),
                            labelText: "Enter your Phone Number",
                            floatingLabelStyle:
                                TextStyle(color: IOTheme.IOGreen),
                            prefixIconColor: IOTheme.IOGreen,
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: IOTheme.IOGreen)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: IOTheme.IOGreen)),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter valid mobile number';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: _password,
                          obscureText: !_passwordVisible,
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: Icon(
                                // Based on passwordVisible state choose the icon
                                _passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: IOTheme.IOGreen,
                              ),
                              onPressed: () {
                                // Update the state i.e. toogle the state of passwordVisible variable
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              },
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: IOTheme.IOGreen)),
                            prefixIcon: Icon(Icons.password_outlined),
                            labelText: "Enter your Password",
                            floatingLabelStyle:
                                TextStyle(color: IOTheme.IOGreen),
                            prefixIconColor: IOTheme.IOBlue,
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: IOTheme.IOGreen)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: IOTheme.IOGreen)),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter valid password';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                fixedSize: Size(
                                    MediaQuery.of(context).size.width * 0.2,
                                    50),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                backgroundColor:
                                    IOTheme.IOBlue.withOpacity(0.5)),
                            onPressed: () {
                              _formKey.currentState!.save();
                              if (_formKey.currentState!.validate()) {
                                _navigationService.navigateTo("/navSelect", arguments: {'pageType': pageType});
                                _saveRegister();
                              }
                            },
                            child: Text("REGISTER",
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
                            color: IOTheme.IOBlue)),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: OutlinedButton.icon(
                          icon: const Image(
                              image: AssetImage("assets/google.png"),
                              height: 20),
                          onPressed: () {
                            _navigationService.navigateTo('/googleAuth');
                          },
                          style: OutlinedButton.styleFrom(
                              fixedSize: Size(
                                  MediaQuery.of(context).size.width * 0.2, 50),
                              backgroundColor: IOTheme.IOBlue.withOpacity(0.5),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20))),
                          label: const Text("Connect With Google",
                              style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    TextButton(
                      onPressed: () {
                        _navigationService.navigateTo("/login");
                      },
                      child: Text.rich(
                        TextSpan(
                            text: "Already an user?",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: IOTheme.IOBlue),
                            children: [
                              TextSpan(
                                  text: " \tLogin",
                                  style: TextStyle(color: IOTheme.IOBlue))
                            ]),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      )
    ]);
  }
}
