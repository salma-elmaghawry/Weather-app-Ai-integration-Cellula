import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather_app/core/helper/constant.dart';
import 'package:weather_app/core/widgets/custom_background.dart';
import 'package:weather_app/core/widgets/custom_evaluated_button.dart';
import 'package:weather_app/core/widgets/custom_textformfield.dart';
import 'package:weather_app/core/widgets/line_with_action.dart';
import 'package:weather_app/features/Auth/presentation/screens/register_screen.dart';
import 'package:weather_app/features/home/presentation/screens/home_screen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  final TextEditingController name = TextEditingController();

  final TextEditingController password = TextEditingController();

  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomBackground(
          child: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView(
            children: [
              const SizedBox(
                height: 50,
              ),
              SvgPicture.asset(signup, height: 200, width: 200),
              const SizedBox(
                height: 20,
              ),
              const Center(
                child: Text(
                  "Login",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextformfield(
                controller: name,
                label: "Name",
                suffixIcon: const Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextformfield(
                controller: password,
                label: "Password",
                obscureText: obscurePassword,
                suffixIcon: IconButton(
                  color: Colors.white,
                  icon: Icon(obscurePassword
                      ? Icons.visibility_off
                      : Icons.visibility),
                  onPressed: () {
                    setState(() {
                      obscurePassword = !obscurePassword;
                    });
                  },
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              CustomEvaluatedButton(
                title: "Login",
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, homeScreen, (route) => false);
                },
              ),
              const SizedBox(
                height: 20,
              ),
              LineWithAction(
                title: "Don't Have Account ?",
                actionName: " Register",
                onTap: () {
                  Navigator.pushNamed(context, registerscreen);
                },
              ),
            ],
          ),
        ),
      )),
    );
  }
}
