import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Get the size in LoginHeaderWidget()
    return Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
            image: DecorationImage(
                opacity: 0.4,
                image: AssetImage("assets/cat.jpg"),
                fit: BoxFit.cover)),
        child: Scaffold(
          backgroundColor: Colors.transparent.withOpacity(0),
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
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.2),
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0),
                        child: Text("Login",
                            style: TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
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
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                            cursorColor: Colors.white,
                            decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                              prefixIcon: Icon(Icons.person_outline_outlined),
                              labelText: "Enter your Email",
                              hintText: "Email Address",
                              floatingLabelStyle:
                                  TextStyle(color: Colors.white),
                              prefixIconColor: Colors.white,
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                            ),
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            enabled: true,
                            decoration: const InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                              prefixIcon: Icon(Icons.fingerprint),
                              labelText: "Enter your password",
                              hintText: "Password",
                              floatingLabelStyle:
                                  TextStyle(color: Colors.white),
                              prefixIconColor: Colors.white,
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 10, color: Colors.white)),
                              suffixIcon: IconButton(
                                onPressed: null,
                                icon: Icon(Icons.remove_red_eye_sharp),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                                onPressed: () {},
                                child: const Text("Forgot Password?",
                                    style: TextStyle(
                                        color: Colors.white,
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
                                  backgroundColor: Colors.grey),
                              onPressed: () {},
                              child: Text("LOGIN",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text("OR",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton.icon(
                          icon: const Image(
                              image: NetworkImage(
                                  'https://cdn1.iconfinder.com/data/icons/google-s-logo/150/Google_Icons-09-512.png&imgrefurl=https%3A%2F%2Fwww.iconfinder.com%2Ficons%2F7123025%2Flogo_google_g_icon&tbnid=ZG2Cl8JppQqAmM&vet=12ahUKEwjO9a_U94X9AhUc-jgGHSWFBhYQMygDegUIARDlAQ..i&docid=SCCOGzKGpUtQ9M&w=512&h=512&q=google%20icons&ved=2ahUKEwjO9a_U94X9AhUc-jgGHSWFBhYQMygDegUIARDlAQ'),
                              width: 20.0),
                          onPressed: () {},
                          label: const Text("Signin With Google"),
                        ),
                      ),
                      const SizedBox(height: 50 - 20),
                      TextButton(
                        onPressed: () {},
                        child: Text.rich(
                          TextSpan(
                              text: "Don't have an account?",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                              children: const [
                                TextSpan(
                                    text: "Signup",
                                    style: TextStyle(color: Colors.blue))
                              ]),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
