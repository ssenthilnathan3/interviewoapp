import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interviewo/utils/constants.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  final TextEditingController _name = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //Get the size in LoginHeaderWidget()

    final _formKey = GlobalKey<FormState>();
    return Stack(children: <Widget>[
      Image.asset(
        "assets/images/background1.jpeg",
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.cover,
      ),
      Scaffold(
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
                              color: Colors.white)),
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
                                borderSide:
                                    BorderSide(color: IOTheme().IOGreen)),
                            prefixIcon: Icon(Icons.email_outlined),
                            labelText: "Enter your Email",
                            floatingLabelStyle:
                                TextStyle(color: IOTheme().IOGreen),
                            prefixIconColor: IOTheme().IOGreen,
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: IOTheme().IOGreen)),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: IOTheme().IOGreen)),
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
                          obscureText: true,
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: IOTheme().IOGreen)),
                            prefixIcon: Icon(Icons.password_outlined),
                            labelText: "Enter your Password",
                            floatingLabelStyle:
                                TextStyle(color: IOTheme().IOGreen),
                            prefixIconColor: IOTheme().IOBlue,
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: IOTheme().IOGreen)),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: IOTheme().IOGreen)),
                          ),
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
                                    MediaQuery.of(context).size.width * 0.2,
                                    50),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                backgroundColor:
                                    IOTheme().IOBlue.withOpacity(0.5)),
                            onPressed: () {},
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
                              image: AssetImage("assets/google.png"),
                              height: 20),
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                              fixedSize: Size(
                                  MediaQuery.of(context).size.width * 0.2, 50),
                              backgroundColor:
                                  IOTheme().IOBlue.withOpacity(0.5),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20))),
                          label: const Text("Signin With Google",
                              style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    TextButton(
                      onPressed: () {},
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
      )
    ]);
  }
}