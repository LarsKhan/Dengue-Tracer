import 'package:dengue_tracing_application/Global/button_widget.dart';
import 'package:dengue_tracing_application/Global/constant.dart';
import 'package:dengue_tracing_application/Global/txtfield_Round.dart';
import 'package:dengue_tracing_application/screens/Authentication/models/User.dart';
import 'package:dengue_tracing_application/screens/Authentication/models/usermodel.dart';

import 'package:flutter/material.dart';

import 'Login.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({
    Key? key,
    this.email,
  }) : super(key: key);

  //const ForgotPassword({super.key});
  final String? email;
  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  TextEditingController passcontr = TextEditingController();

  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          //backgroundColor: Colors.amber,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  CircleAvatar(
                    radius: 70,
                    backgroundColor: Colors.transparent,
                    child: Image.asset("assets/dengu.png"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Dengue Tracing Application",
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      color: btnColor,
                      fontSize: 35,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // const SizedBox(
                  //   height: 10,
                  // ),
                  Text(
                    "Enter Your New Password?",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: grayshade,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  MyTextField(
                    maxlines: 1,
                    //siconn: Icons.email,
                    controller: passcontr,
                    hintText: "Password",
                    obscureText: isVisible,

                    prefixIcon: const Icon(Icons.password),
                    sufixIconPress: () {
                      setState(() {
                        isVisible = !isVisible;
                      });
                    },
                    sufixIcon:
                        isVisible ? Icons.visibility : Icons.visibility_off,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // MyTextField(
                  //   maxlines: 1,
                  //   //siconn: Icons.email,
                  //   controller: emailcontr,
                  //   hintText: "Repeat Password",
                  //   obscureText: isVisible,

                  //   prefixIcon: const Icon(Icons.password),
                  //   sufixIconPress: () {
                  //     setState(() {
                  //       isVisible = !isVisible;
                  //     });
                  //   },
                  //   sufixIcon:
                  //       isVisible ? Icons.visibility : Icons.visibility_off,
                  // ),
                  // const SizedBox(
                  //   height: 20,
                  // ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SizedBox(
                      height: 50,
                      width: 3000,
                      child: ButtonWidget(
                        btnText: "Save",
                        onPress: (() async {
                          User u = User();
                          u.email = "${widget.email}";
                          u.password = passcontr.text;
                          newpassword(u, context);
                          // Navigator.of(context).push(
                          //   MaterialPageRoute(
                          //     builder: (context) => const LoginScreen(),
                          //   ),
                          // );
                        }),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Back To Login?",
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                          fontSize: 15,
                        ),
                      ),
                      TextButton(
                        onPressed: (() {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                          );
                        }),
                        child: const Text(
                          "Login",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Color.fromARGB(255, 226, 99, 99),
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
