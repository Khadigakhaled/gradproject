
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gradproject/view/screens/preferncescreen.dart';
import 'package:provider/provider.dart';

import '../../../provider/auth/auth_provider.dart';
import 'login_screen.dart';


class RegisterScreen extends StatefulWidget {

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  //  GlobalKey<_formkey> _formkey ;

  var _email = TextEditingController();

  var _password = TextEditingController();

  var _name = TextEditingController();

  // var _allergy= TextEditingController();

// void initstate(){
//   super.initState();
//   _formKey=GlobalKey();
//
// }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Sign Up",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "1/2",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.grey),
                textAlign: TextAlign.center,

              ),

              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _name,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter your name";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  label: Text('Name'),
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color:Colors.deepPurple.shade100)
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _email,
                validator: (value) {
                  if (value!.isEmpty || !value.contains("@")) {
                    return "Please enter your email";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  label: Text('Email'),
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color:Colors.deepPurple.shade100)
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _password,
                validator: (value) {
                  if (value!.isEmpty || value.length < 6) {
                    return "Please enter your password";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: 'Enter Password',
                  label: Text('Password'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color:Colors.deepPurple.shade100)
                  ),
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: Icon(Icons.remove_red_eye),
                ),
              ),
              SizedBox(
                height: 20,
              ),


              Container(
                child: ElevatedButton(
                  onPressed: () {
                    if(_formKey.currentState!.validate()) {

                    // Provider.of<AuthProvider>(context,listen: false).signup(_email.text, _password.text, _name.text, _allergy.text, dropdownvalue,);
                    Navigator.of(context).push(MaterialPageRoute(builder:(context)=> Preference_screen(e: _email, p: _password, n: _name,)
                    ));

                    }
                  },
                  child: Text('Next', style: TextStyle(fontSize: 20)),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      primary: Colors.purple[300]
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have an account?'),
                  TextButton(
                    onPressed: () {
                    Get.to(LoginScreen());
                    },
                    child: Text('Login',style: TextStyle(color: Colors.deepPurple),),
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
