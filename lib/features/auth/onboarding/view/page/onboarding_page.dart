import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/auth/onboarding/controller/cubit/onboarding_controller_cubit.dart';
import 'package:flutter_application_1/features/auth/onboarding/view/components/onboarding_body.dart';
import 'package:flutter_application_1/features/auth/onboarding/view/components/onboarding_buttons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider<OnboardingControllerCubit>(
                create: (context) => OnboardingControllerCubit(),
                child: BlocBuilder<OnboardingControllerCubit,
                    OnboardingControllerState>(
                  builder: (context, state) {
                    OnboardingControllerCubit controller =
                        context.read<OnboardingControllerCubit>();
            return Scaffold(
              body: OnBoardingBody(controller: controller,),
          bottomNavigationBar:  OnBoardingButtons(controller: controller,),
            );
          },
        ),
        
      ),
    );
    return const Placeholder();
  }
}
