import 'package:flutter/material.dart';
import 'package:toktok/core/utils/color_utils.dart';
import 'package:toktok/features/auth/controllers/auth_controller.dart';
import 'package:toktok/features/auth/login/login_screen.dart';
import 'package:toktok/features/auth/register/widgets/signup_text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "TokTok",
              style: TextStyle(
                  fontSize: 35,
                  color: buttonColor,
                  fontWeight: FontWeight.w900),
            ),
            const Text(
              "Sign up",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 15),
            Form(child: Column(
              children: [
                Stack(
                  children: [
                    const CircleAvatar(
                      radius: 70,
                      backgroundImage: NetworkImage('https://cdn1.vectorstock.com/i/thumb-large/62/60/default-avatar-photo-placeholder-profile-image-vector-21666260.jpg'),
                      backgroundColor: Colors.grey,
                    ),
                    Positioned(
                        bottom: -10,
                        left: 80,
                        child: IconButton(
                          onPressed: () => AuthController.instance.pickImage(),
                          icon: const Icon(Icons.add_a_photo),
                        ))
                  ],
                ),
                const SizedBox(height: 15,),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: SignUpFields(
                    controller: _usernameController,
                    icon: Icons.person,
                    labelText: "User name",
                    isObscure: false,
                    // isObscure: false,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: SignUpFields(
                    controller: _emailController,
                    icon: Icons.email_outlined,
                    labelText: "Email", isObscure: false,
                    // isObscure: false,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: SignUpFields(
                    controller: _passwordController,
                    icon: Icons.password,
                    labelText: "Password",
                    isObscure: true,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    print('********** Start ************');
                    AuthController.instance.registerUser(_usernameController.text, _emailController.text, _passwordController.text, AuthController.instance.profilePhoto);
                    print ("************End*************");},
                  child: Container(
                    width: MediaQuery.of(context).size.width - 40,
                    height: 50,
                    decoration: BoxDecoration(
                      color: buttonColor,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    child: const Center(
                        child: Text(
                          "Sign up",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        )),
                  ),
                ),
              ],
            )),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Already have an account? ",
                  style: TextStyle(fontSize: 20),
                ),
                InkWell(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LoginScreen())),
                    child: Text(
                      "Login",
                      style: TextStyle(color: buttonColor, fontSize: 20),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
