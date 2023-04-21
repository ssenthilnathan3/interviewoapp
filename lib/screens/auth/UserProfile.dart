import 'package:flutter/material.dart';
import 'package:interviewo/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePageUI extends StatefulWidget {
  const ProfilePageUI({Key? key}) : super(key: key);

  @override
  State<ProfilePageUI> createState() => _ProfilePageUIState();
}

class _ProfilePageUIState extends State<ProfilePageUI> {
  final _formKey = GlobalKey<FormState>();

  bool isEdit = false;
  String? name, email;
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();

  _getUserData() async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();

    setState(() {
      name = _prefs.getString('name') ?? '';
      email = _prefs.getString('email') ?? '';
    });
  }

  @override
  void initState() {
    super.initState();

    _getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: IOTheme.IOGreen,
          actions: [
            IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  setState(() {
                    isEdit = !isEdit;
                  });
                })
          ],
        ),
        body: Column(
          children: [
            SizedBox(height: 50),
            // Image Circle
            CircleAvatar(
              radius: 50.0,
              backgroundImage: NetworkImage(
                'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__340.png',
              ),
            ),
            // Form
            Form(
              key: _formKey,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      enabled: isEdit,
                      controller: _name,
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        hintText: isEdit ? name : "Enter your name",
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: IOTheme.IOGreen)),
                        prefixIcon: Icon(Icons.email_outlined),
                        floatingLabelStyle: TextStyle(color: IOTheme.IOGreen),
                        prefixIconColor: IOTheme.IOGreen,
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: IOTheme.IOGreen)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: IOTheme.IOGreen)),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      enabled: isEdit,
                      controller: _email,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: IOTheme.IOGreen)),
                        prefixIcon: Icon(Icons.password_outlined),
                        hintText: isEdit ? email : "Enter your email",
                        floatingLabelStyle: TextStyle(color: IOTheme.IOGreen),
                        prefixIconColor: IOTheme.IOBlue,
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: IOTheme.IOGreen)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: IOTheme.IOGreen)),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter valid email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 50),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            fixedSize: Size(
                                MediaQuery.of(context).size.width * 0.2, 50),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            backgroundColor: IOTheme.IOBlue.withOpacity(0.5)),
                        onPressed: () {
                          _formKey.currentState!.save();
                        },
                        child: Text("Update",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
