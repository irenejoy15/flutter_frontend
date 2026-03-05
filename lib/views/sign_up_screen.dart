import 'package:flutter/material.dart';
import 'package:shop_app/controllers/auth_controller.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // VALIDATION
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // CONTROLLER
  final AuthController _authController = AuthController();
  late String email;
  late String fullName;
  late String password;


  bool _isloading = false;
  void signUpUsers() async {
    if(_formKey.currentState!.validate()){
      setState(() {
        _isloading = true;
      });
      await _authController.signUpUsers(
          email: email,
          fullName: fullName,
          password: password,
          context: context,
        );
      setState(() {
        _isloading = false;
      });
    }else{
      print('all fields are required');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    'CREATE YOUR ACCOUNT',
                    style: TextStyle(
                      fontSize: 19, 
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.7
                    ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  onChanged: (value) {
                    email = value;
                  },
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'Please enter your email';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  onChanged: (value) {
                    fullName = value;
                  },
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'Please enter your full name';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'FullName',
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  onChanged: (value) {
                    password = value;
                  },
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'Please enter your password';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock),
                  ),
                ),
                SizedBox(height: 20),
            
                InkWell(
                  onTap: () {
                    signUpUsers();
                  },
                  child: Container(
                    width:319,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      gradient: LinearGradient(
                        colors: [Color(0xFF102DE1), Color(0xCC0D6EFF)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Center(
                      child: _isloading? CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ) : Text(
                        'SIGN UP',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}