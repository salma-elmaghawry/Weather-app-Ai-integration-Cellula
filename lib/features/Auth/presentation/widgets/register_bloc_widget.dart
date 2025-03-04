import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/core/helper/extenstions.dart';
import 'package:weather_app/core/routing/routes.dart';
import 'package:weather_app/core/widgets/custom_evaluated_button.dart';
import 'package:weather_app/features/Auth/data/auth_repo.dart';
import 'package:weather_app/features/Auth/presentation/cubits/auth/auth_cubit.dart';

class RegisterBlocWidget extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController email;
  final TextEditingController password;

  const RegisterBlocWidget({
    Key? key,
    required this.formKey,
    required this.email,
    required this.password,
  }) : super(key: key);

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
    return BlocProvider(
      create: (context) => AuthCubit(AuthRepo()),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
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
                context
                    .read<AuthCubit>()
                    .register(email.text.trim(), password.text.trim());
              }
            },
          );
        },
      ),
    );
  }
}
