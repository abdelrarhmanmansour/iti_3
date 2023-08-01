import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class SginScreen extends StatefulWidget {
  const SginScreen({Key? key}) : super(key: key);

  @override
  State<SginScreen> createState() => _SginScreenState();
}

class _SginScreenState extends State<SginScreen> {
  bool visible = true;
  TextEditingController userController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  var formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(children: <Widget>[
          Container(
            height: double.infinity,
            width: double.infinity,
            child: SingleChildScrollView(
              child: Form(
                key: formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const Text("SIGN",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 38)),
                    const SizedBox(
                      height: 40,
                    ),

                    Container(
                      margin: const EdgeInsets.only(left: 32, right: 32),
                      child:  TextFormField(
                        controller: userController,
                        validator: (value){
                          if(value!.isEmpty){
                            return "username must not empty";
                          }
                          return null;
                        }
                        ,
                        style: TextStyle(),
                        scrollPadding: EdgeInsets.all(10),
                        decoration: const InputDecoration(
                          prefixIcon:Icon(Icons.account_circle) ,
                          contentPadding: EdgeInsets.all(20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                                Radius.circular(15)

                            ),

                            borderSide: (
                                BorderSide(
                                    color: Color.fromARGB(255, 94, 171, 96))
                            ),
                          ),


                          hintStyle: TextStyle(color: Colors.black),
                          labelText: 'Username',
                        ),
                        keyboardType: TextInputType.name,

                      ),
                    ),
                    const SizedBox(
                      height: 35,
                    ),


                    Container(
                      margin: const EdgeInsets.only(left: 32, right: 32),
                      child:  TextFormField(
                        controller:emailController,
                        validator: (value){
                          if(value!.isEmpty){
                            return "email must not empty";
                          }
                          return null;
                        }
                        ,
                        style: TextStyle(),
                        scrollPadding: EdgeInsets.all(10),
                        decoration: const InputDecoration(
                          prefixIcon:Icon(Icons.email) ,
                          contentPadding: EdgeInsets.all(20),
                          border: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(15))),


                          hintStyle: TextStyle(color: Colors.black),
                          labelText: 'Email',
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 32, right: 32),
                      child: TextFormField(
                        controller: passController,
                        validator: (value){
                          if(value!.isEmpty){
                            return "password must not empty";
                          }
                          return null;
                        }
                        ,
                        obscureText: visible ,
                        style: TextStyle(),
                        scrollPadding: EdgeInsets.all(10),
                        decoration: InputDecoration(
                          prefixIcon:Icon(Icons.lock) ,
                          suffixIcon: IconButton(
                              onPressed:(){
                                setState(() {
                                  visible = !visible;

                                });
                              },
                              icon: visible
                                  ?const Icon(Icons.remove_red_eye)
                                  :  const Icon(Icons.visibility_off)
                          ),
                          contentPadding: EdgeInsets.all(20),
                          border: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(15))),


                          hintStyle: TextStyle(color: Colors.black),
                          labelText: 'Password',
                        ),
                        keyboardType: TextInputType.visiblePassword,
                      ),
                    ),

                    const SizedBox(
                      height: 35,
                    ),


                    ElevatedButton(
                      style: TextButton.styleFrom(
                        shape: StadiumBorder(),
                        //padding: EdgeInsets.symmetric(vertical: 20,horizontal: 120),
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 120),
                        backgroundColor: Color.fromARGB(240, 10, 177, 100),
                      ),
                      onPressed: () {
                        if(formkey.currentState!.validate()){

                          print(userController.text);
                          print(emailController.text);
                          print(passController.text);
                          FirebaseAuth.instance.createUserWithEmailAndPassword(email:emailController.text , password:passController.text );

                        }

                      },

                      child: const Text(
                        "Sign",
                        style:

                        TextStyle(
                          fontSize: 35,
                          color: Colors.white,
                        ),

                      ),

                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(" Have an account? "),
                        TextButton(onPressed: () {

                        }, child: const Text(
                          "LOG IN",

                          style: TextStyle(color: Colors.green),))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
        ),
      ),
    );
  }
}