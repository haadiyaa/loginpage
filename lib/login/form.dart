import 'package:flutter/material.dart';
import 'package:myloginpage/home/homescreen.dart';
import 'package:myloginpage/splashscreen/splashscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => FormPageState();
}

class FormPageState extends State<FormPage> {
  

  final key = GlobalKey<FormState>();
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();
  final name = RegExp(r'^[A-Za-z]+$');
  final paswd =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  bool _pass = true;

  String? myName;

  FormPageState({this.myName});

  InputBorder buildFocusBorder = const OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(20),
    ),
    borderSide: BorderSide(
      color: Colors.green,
      width: 1.5,
    ),
  );
  InputBorder buildenabled = const OutlineInputBorder(
    borderSide: BorderSide(
      width: 1.5,
      color: Color.fromARGB(255, 167, 116, 255),
    ),
  );
  InputBorder buildBorder = const OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 195, 178, 226),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 78, 60, 110),
          title: const Center(
            child: Text(
              'Login Page',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
        body:  Padding(
        padding: const EdgeInsets.only(
          top: 30.0,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Card(
                    color: Colors.deepPurple.shade50,
                    elevation: 10,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Form(
                        key: key,
                        child: Column(
                          children: [
                            TextFormField(
                              keyboardType: TextInputType.name,
                              controller: controller1,
                              validator: (value) {
                                if (controller1.text.isEmpty) {
                                  return 'Name can\'t be empty';
                                } else if (controller1.text.length < 3) {
                                  return 'Name should be atleast 3 characters';
                                } else if (!name.hasMatch(controller1.text)) {
                                  return "Enter a valid name";
                                }
                              },
                              decoration: InputDecoration(
                                errorMaxLines: 10,
                                errorStyle: TextStyle(
                                  overflow: TextOverflow.clip,
                                ),
                                focusedBorder: buildFocusBorder,
                                labelStyle: const TextStyle(
                                  color: Color.fromARGB(255, 167, 116, 255),
                                ),
                                label: const Text(
                                  "User Name",
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                                enabledBorder: buildenabled,
                                border: buildBorder,
                                hintText: 'Enter the user name',
                                hintStyle: const TextStyle(
                                  color: Color.fromARGB(255, 190, 190, 190),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              obscureText: _pass,
                              controller: controller2,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter the password';
                                } else if (!paswd.hasMatch(value)) {
                                  return 'Password should contain at least one upper case, one lower case, one digit, one special character and must be 8 characters in length';
                                }
                              },
                              decoration: InputDecoration(
                                errorMaxLines: 10,
                                errorStyle:const TextStyle(
                                  overflow: TextOverflow.clip,
                                ),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(
                                      () {
                                        _pass = !_pass;
                                      },
                                    );
                                  },
                                  icon: Icon(
                                    _pass ? Icons.visibility_off : Icons.visibility,
                                    size: 23,
                                  ),
                                ),
                                focusedBorder: buildFocusBorder,
                                labelStyle: const TextStyle(
                                  color: Color.fromARGB(255, 167, 116, 255),
                                ),
                                label: const Text(
                                  "Password",
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                                enabledBorder: buildenabled,
                                border: buildBorder,
                                hintText: 'Enter the password',
                                hintStyle: const TextStyle(
                                  color: Color.fromARGB(255, 190, 190, 190),
                                ),
                              ),
                            ),
                            const SizedBox(height: 30),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.all(20),
                                  elevation: 10,
                                  backgroundColor:
                                      const Color.fromARGB(255, 167, 116, 255),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                onPressed: () async {
                                  if (key.currentState!.validate()) {
                                    myName=controller1.text;

                                    var sharedPref=await SharedPreferences.getInstance();
                                    sharedPref.setBool(SplashScreenState.KEYLOGIN, true);

                                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                                        builder: (context) => HomeScreen()));
                                  }
                                },
                                child: const Text(
                                  "L O G I N",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 237, 231, 246),
                                      fontWeight: FontWeight.bold),
                                ),
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
        ),
    );
  }

  
}
