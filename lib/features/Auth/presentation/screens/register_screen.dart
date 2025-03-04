import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
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

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();

  final TextEditingController name = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController email = TextEditingController();

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
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
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
                  "Register",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 30,
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
                controller: email,
                label: "Email",
                suffixIcon: const Icon(
                  Icons.email,
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
                height: 40,
              ),
              BlocProvider(
                create: (context) => AuthCubit(AuthRepo()),
                child: BlocConsumer<AuthCubit, AuthState>(
                  listener: (context, state)  {
                    if (state is AuthSuccess) {
                      AwesomeDialog(
                          context: context,
                          dialogType: DialogType.success,
                          animType: AnimType.bottomSlide,
                          title: 'Success',
                          desc: state.message,
                          btnOkOnPress: () async {
                            Position position = await _getCurrentLocation();
                            final searchValue =
                                '${position.latitude},${position.longitude}';
                            context.pushNamedAndRemoveUntil(
                              Routes.homeScreen,
                              arguments: {'searchValue': searchValue},
                              routePredicate: (route) => false,
                            );
                          },
                          btnOkColor: Colors.green,
                        ).show();
                    } else if (state is AuthError) {
                    AwesomeDialog(
                          context: context,
                          dialogType: DialogType.error,
                          animType: AnimType.bottomSlide,
                          title: 'Error',
                          desc: state.message,
                          btnOkOnPress: () {},
                          btnOkColor: Colors.red,
                        ).show();
                    }
                  },
                  builder: (context, state) {
                    if (state is AuthLoading) {
                      return Center(child: CircularProgressIndicator());
                    }
                    return CustomEvaluatedButton(
                      title: "Register",
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          context.read<AuthCubit>().register(
                              email.text.trim(), password.text.trim());
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
                title: "Already Have an account ?",
                actionName: " Login",
                onTap: () {
                  context.pushNamed(Routes.loginScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
