import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utilis/context_extension.dart';
import 'package:flutter_application_1/features/auth/registeration/controller/cubit/registration_cubit.dart';
import 'package:flutter_application_1/features/auth/registeration/view/component/loginPage.dart';
import 'package:flutter_application_1/features/auth/registeration/view/component/verification_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavWidget extends StatelessWidget {
  BottomNavWidget({super.key, required this.controller});
  // TextEditingController nameController = TextEditingController();
  final RegistrationCubit controller;
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
        value: controller,
        child: BlocBuilder<RegistrationCubit, RegistrationState>(
            builder: (context, state) {
          RegistrationCubit controller = context.read<RegistrationCubit>();

          return Column(
            children: [
              // SizedBox(
              //   height: context.height
              // ),
              FilledButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          const Color.fromARGB(255, 232, 126, 162))),
                  onPressed: () {
                    //  Navigator.push(
                    //     context,
                    //     MaterialPageRoute(builder: (context) => OTPPage()),
                    //   );
                    controller.onPressedConfirmButton(context);
                  },
                  child: Text("confirm")),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Have an Account?",
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => loginPage()),
                      );
                    },
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => loginPage()),
                          );
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(
                              color: Color.fromARGB(255, 232, 126, 162),
                              decoration: TextDecoration.underline,
                              decorationColor: Color.fromARGB(
                                255,
                                232,
                                126,
                                162,
                              )),
                        )),
                  ),
                ],
              )
            ],
          );
        }));
  }
}
