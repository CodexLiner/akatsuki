import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waste_manager/app/data/controllers/user_controller.dart';

import '../../models/user_model/user_model.dart';
import '../home_screens/home_screen.dart';



class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignInState();
}

class _SignInState extends State<SignUpScreen> {

  final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final secondNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void initState() {
    Get.find<UserController>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
              image: DecorationImage(
                image:AssetImage("assets/images/background_page2.png"),
                fit: BoxFit.cover,
              )
          ),

          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(27)
                ),

                child: Padding(
                  padding: const EdgeInsets
                      .symmetric(vertical: 0, horizontal: 25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      Container(
                        height: 200,
                        width: 200,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/sign_up_vector.png"),
                              fit: BoxFit.cover
                          ),
                        ),
                      ),

                      const Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(

                        validator:(value) {
                          if(value!.isEmpty){
                            return "First name cant be empty";
                          }
                          return null;
                        },
                        controller: firstNameController,
                        style: const TextStyle(
                          color: Colors.black,
                        ),

                        decoration: InputDecoration(

                          labelText: "First Name",
                          labelStyle: const TextStyle(
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),

                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(

                        validator:(value) {
                          if(value!.isEmpty){
                            return "Last name cant be empty";
                          }
                          return null;
                        },
                        controller: secondNameController,
                        style: const TextStyle(
                          color: Colors.black,
                        ),

                        decoration: InputDecoration(

                          labelText: "Last Name",
                          labelStyle: const TextStyle(
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),

                      const SizedBox(
                        height: 10,
                      ),

                      TextFormField(

                        validator:(value) {
                          if(value!.isEmpty){
                            return "Email cant be empty";
                          }
                          return null;
                        },
                        controller: emailController,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          labelText: "Email-Id",
                          labelStyle: const TextStyle(
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),

                      TextFormField(
                        validator:(value) {
                          if(value!.isEmpty){
                            return "Password cant be empty";
                          }
                          return null;
                        },
                        controller: passwordController,
                        obscureText: true,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          labelText: "Password",
                          labelStyle: const TextStyle(
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),

                      TextFormField(

                        validator:(value) {
                          if(confirmPasswordController.text!=passwordController.text){
                            return "Password doesn't match";
                          }
                          return null;
                        },
                        controller: confirmPasswordController,
                        style: const TextStyle(
                          color: Colors.black,
                        ),

                        decoration: InputDecoration(
                          labelText: "Confirm Password",
                          labelStyle: const TextStyle(
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),

                      GetBuilder<UserController>(
                        builder:(userController){
                          return Padding(
                            padding: const EdgeInsets.all(10),
                            child: ElevatedButton(
                              onPressed: () async {

                                if(_formKey.currentState!.validate()){
                                  await _auth.createUserWithEmailAndPassword(
                                      email: emailController.text,
                                      password: confirmPasswordController.text
                                  );
                                  await userController.postUserInfo(
                                      UserModel(
                                          uid: FirebaseAuth.instance.currentUser!.uid,
                                          user_password: confirmPasswordController.text,
                                          user_email: emailController.text,
                                          username: firstNameController.text+secondNameController.text
                                      )
                                  ).then((value) => {
                                    log(value.toString()),
                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomePage()))
                                  });
                                }
                              },
                              style: ElevatedButton.styleFrom(

                                primary: const Color.fromARGB(255, 17, 7, 75),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(vertical: 13,horizontal: 10),
                                child: Text(
                                  "Sign Up",
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

