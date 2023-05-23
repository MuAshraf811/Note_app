import 'package:flutter/material.dart';
import 'package:my_app/views/EditNoteView.dart';
import 'package:my_app/views/home_page.dart';
import 'package:my_app/views/onBordingViews/secondOnBoardingView.dart';

Map <String , Widget Function(BuildContext) > router =
 {
  'home' :(p0) =>  const HomePage(),
  'editView' :(p0) =>  EditNoteView(),
   'welcomeScreen' :(p0) => const WelcomeScreen(),
 };