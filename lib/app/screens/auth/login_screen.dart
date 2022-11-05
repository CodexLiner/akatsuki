
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:waste_manager/app/screens/auth/sign_up_screen.dart';

import '../../data/controllers/user_controller.dart';
import '../home_screens/home_screen.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _auth = FirebaseAuth.instance;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    Get.find<UserController>();
    super.initState();
  }

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final emailField=TextFormField(

      validator: (value) {
        if(value!.isEmpty){
          return "Email Id cant be empty";
        }
        return null;
      },
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,

      onSaved: (value){
        emailController.text=value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon:  const Icon(
          Icons.email_outlined,
          size: 20,
          color: Colors.black,
        ),
        labelText: "User Name",
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(13)
        ),
        labelStyle: const TextStyle(
          color: Colors.black,
        ),
      ),
    );

    final passwordField=TextFormField(

      validator: (value) {
        if(value!.isEmpty){
          return "Password cant be empty";
        }
        return null;
      },
      autofocus: false,
      controller: passwordController,

      onSaved: (value){
        emailController.text=value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          prefixIcon:  const Icon(
            Icons.lock,
            size: 20,
            color: Colors.black,
          ),
          labelText: "Password",
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(13)
          ),
          labelStyle: const TextStyle(
            color: Colors.black,
          )
      ),
    );
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/background_page1.png"),
                fit: BoxFit.cover
            ),
          ),
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Container(
                    height: 200,
                    width: 200,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/hello_vector.png"),
                          fit: BoxFit.cover
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 255, 255).withOpacity(0),
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(27),bottom: Radius.circular(27)),
                    ),

                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 30
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[

                          const Text(
                            "Login",
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w500
                            ),
                          ),

                          const SizedBox(
                            height: 60,
                          ),

                          emailField,

                          const SizedBox(
                            height: 25,
                          ),

                          passwordField,

                          const SizedBox(
                            height: 30,
                          ),

                          GetBuilder<UserController>(
                              builder: (userController){
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {

                                        if(_formKey.currentState!.validate()) {
                                          _auth.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text)
                                              .then((user) async => {
                                            await userController.getUserInfo(FirebaseAuth.instance.currentUser!.uid),
                                            Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(_)=> const HomePage())),
                                            Fluttertoast.showToast(msg: "Login Successful")
                                          }).catchError((e){
                                            Fluttertoast.showToast( msg:'No user exist with this email id');
                                          });
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(

                                          primary: const Color.fromARGB(255, 17, 7, 75)),
                                      child: const Padding(
                                        padding: EdgeInsets.all(15),
                                        child: Text("Login"),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).push(MaterialPageRoute(builder: (_) => const SignUpScreen()));
                                      },
                                      style: ElevatedButton.styleFrom(

                                        // ignore: prefer_const_constructors
                                          primary: Color.fromARGB(255, 17, 7, 75)),
                                      child: const Padding(
                                        padding: EdgeInsets.all(15.0),
                                        child: Text("Sign Up"),
                                      ),
                                    ),
                                  ],
                                );
                              }),
                          const SizedBox(
                            height: 20,
                          ),
                          InkWell(
                            onTap: () {},
                            child: const SizedBox(
                              width: 150,
                              height: 30,
                              child: Text("Forgot Password?",

                                style: TextStyle(
                                  color: Color.fromARGB(255, 17, 7, 75),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}