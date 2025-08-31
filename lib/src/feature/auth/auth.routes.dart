import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rider/src/core/config/app.routes.dart';
import 'package:rider/src/feature/auth/on_boarding/presentation/onBoarding_profile_image.screen.dart';
import 'package:rider/src/feature/auth/on_boarding/presentation/onboarding_status.screen.dart';
import 'package:rider/src/feature/auth/sign_in/phone_number/sign_in_with_phone_number.screen.dart';
import 'package:rider/src/feature/auth/sign_up/presentation/sign_up.screen.dart';

import 'forgot_password/forgot_password.screen.dart';
import 'on_boarding/presentation/complete_onboarding.screen.dart';
import 'on_boarding/presentation/onboarding.screen.dart';
import 'on_boarding/presentation/onboarding_documents.screen.dart';
import 'on_boarding/presentation/onboarding_payment_method.screen.dart';
import 'on_boarding/presentation/onboarding_vehicle_details.screen.dart';
import 'sign_in/email/sign_in_with_email.screen.dart';

class AuthRoutes {
  static final authRoutes = ShellRoute(
    builder: (context, state, child) => Scaffold(body: child),
    routes: [
      /// Sign up screen -------------------------------------------------------
      GoRoute(
        name: AppRoutesNames.signUpScreen,
        path: AppRoutesNames.signUpScreen,
        builder: (context, state) => const SignUpScreen(),
      ),

      /// Sign in screen -------------------------------------------------------
      GoRoute(
        name: AppRoutesNames.signInWithEmailScreen,
        path: AppRoutesNames.signInWithEmailScreen,
        builder: (context, state) => const SignInWithEmailScreen(),
      ),

      /// Sign in with phone number screen -------------------------------------
      GoRoute(
        name: AppRoutesNames.signInWithPhoneNumberScreen,
        path: AppRoutesNames.signInWithPhoneNumberScreen,
        builder: (context, state) => SignInWithPhoneNumberScreen(),
      ),

      /// Verify phone number screen -------------------------------------------
      // GoRoute(
      //   name: AppRoutesNames.verifyPhoneNumberScreen,
      //   path: AppRoutesNames.verifyPhoneNumberScreen,
      //   builder: (context, state) => const VerifyPhoneNumberScreen(),
      // ),

      /// on-boarding screen ---------------------------------------------------
      GoRoute(
        name: AppRoutesNames.onBoardingScreen,
        path: AppRoutesNames.onBoardingScreen,
        builder: (context, state) => const OnBoardingScreen(),
      ),

      /// Complete on-boarding screen ------------------------------------------
      GoRoute(
        name: AppRoutesNames.completeOnBoardingScreen,
        path: AppRoutesNames.completeOnBoardingScreen,
        builder: (context, state) => const CompleteOnBoardingScreen(),
      ),

      /// Forgot password screen ------------------------------------------------
      GoRoute(
        name: AppRoutesNames.forgotPasswordScreen,
        path: AppRoutesNames.forgotPasswordScreen,
        builder: (context, state) => const ForgotPasswordScreen(),
      ),

      /// Forgot password verify otp screen ------------------------------------
      // GoRoute(
      //   name: AppRoutesNames.forgotPasswordVerifyOtpScreen,
      //   path: "${AppRoutesNames.forgotPasswordVerifyOtpScreen}/:email",
      //   builder: (context, state) => ForgotPasswordVerifyPhoneNumberScreen(
      //     email: state.pathParameters['email'],
      //   ),
      // ),

      /// Onboarding vehicle details screen ------------------------------------
      GoRoute(
        name: AppRoutesNames.onboardingVehicleDetailsScreen,
        path: AppRoutesNames.onboardingVehicleDetailsScreen,
        builder: (context, state) => OnboardingVehicleDetailsScreen(),
      ),

      /// Onboarding documents screen ------------------------------------------
      GoRoute(
        name: AppRoutesNames.onboardingDocumentsScreen,
        path: AppRoutesNames.onboardingDocumentsScreen,
        builder: (context, state) => const OnboardingDocumentsScreen(),
      ),

      /// Onboarding payment method screen ------------------------------------
      GoRoute(
        name: AppRoutesNames.onboardingPaymentMethodScreen,
        path: AppRoutesNames.onboardingPaymentMethodScreen,
        builder: (context, state) => const OnboardingPaymentMethodScreen(),
      ),

      /// Onboarding status screen ---------------------------------------------
      GoRoute(
        name: AppRoutesNames.onboardingStatusScreen,
        path: AppRoutesNames.onboardingStatusScreen,
        builder: (context, state) => const OnBoardingStatusScreen(),
      ),

      /// Onboarding profile image screen -------------------------------------
      GoRoute(
        name: AppRoutesNames.onboardingProfileImageScreen,
        path: AppRoutesNames.onboardingProfileImageScreen,
        builder: (context, state) => const OnBoardingProfileImage(),
      ),
    ],
  );
}
