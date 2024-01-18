import 'package:flutter/material.dart';
import 'package:myloginpage/login/form.dart';
import 'package:myloginpage/splashscreen/splashscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatelessWidget {

  
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 195, 178, 226),
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 78, 60, 110),
        title: const Center(
          child:  Text(
            'Home',
            style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              const Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Color.fromARGB(255, 136, 108, 185),
                      child: Icon(
                        Icons.person,
                        color: Color.fromARGB(255, 235, 223, 255),
                        size: 60,
                      ),
                    ),
                    SizedBox(height: 5,),
                    Text('Edit',style: TextStyle(color: Color.fromARGB(255, 29, 112, 26)),),
                  ],
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              SizedBox(
                height: 200,
                child: ListView(
                  children: const[
                    ListTile(
                      contentPadding: EdgeInsets.all(10),
                      leading: Icon(Icons.person),
                      title: Text(
                        'My Account',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios_sharp,
                        size: 15,
                        color: Colors.grey,
                      ),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.all(10),
                      leading: Icon(Icons.location_on),
                      title: Text(
                        'Address',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios_sharp,
                        size: 15,
                        color: Colors.grey,
                      ),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.all(10),
                      leading: Icon(Icons.message),
                      title: Text(
                        'Help Centre',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios_sharp,
                        size: 15,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20,),
              Center(
                child: TextButton(
                  onPressed: () async{
                    
                    var sharedPref=await SharedPreferences.getInstance();
                    sharedPref.setBool(SplashScreenState.KEYLOGIN, false);

                     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>FormPage()));
                  },
                  child: const Text('Logout',style: TextStyle(color:Colors.red,fontSize: 18,fontWeight: FontWeight.bold),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
