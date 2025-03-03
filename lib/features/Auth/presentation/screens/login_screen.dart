import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/core/helper/constant.dart';
import 'package:weather_app/core/helper/extenstions.dart';
import 'package:weather_app/core/routing/routes.dart';
import 'package:weather_app/core/widgets/custom_background.dart';
import 'package:weather_app/core/widgets/custom_evaluated_button.dart';
import 'package:weather_app/core/widgets/custom_textformfield.dart';
import 'package:weather_app/core/widgets/line_with_action.dart';
import 'package:weather_app/features/Auth/data/auth_repo.dart';
import 'package:weather_app/features/Auth/presentation/cubits/auth/auth_cubit.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  bool obscurePassword = true;

  Future<Position> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

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
                  controller: email,
                  label: "Email",
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
                BlocProvider(
                  create: (context) => AuthCubit(AuthRepo()),
                  child: BlocConsumer<AuthCubit, AuthState>(
                    listener: (context, state) async {
                      if (state is AuthSuccess) {
                        Position position = await _getCurrentLocation();
                        final searchValue =
                            '${position.latitude},${position.longitude}';
                        context.pushNamedAndRemoveUntil(
                          Routes.homeScreen,
                          arguments: {'searchValue': searchValue},
                          routePredicate: (route) => false,
                        );
                      } else if (state is AuthError) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(state.message)),
                        );
                      }
                    },
                    builder: (context, state) {
                      if (state is AuthLoading) {
                        return Center(child: CircularProgressIndicator());
                      }
                      return CustomEvaluatedButton(
                        title: "Login",
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            context
                                .read<AuthCubit>()
                                .login(email.text.trim(), password.text.trim());
                          }
                        },
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                LineWithAction(
                  title: "Don't Have Account ?",
                  actionName: " Register",
                  onTap: () {
                    context.pushNamed(Routes.registerScreen);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
