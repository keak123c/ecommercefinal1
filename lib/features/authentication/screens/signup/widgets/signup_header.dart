import 'package:flutter/material.dart';

class SignupHeader extends StatelessWidget {
  const SignupHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text("Let's create your account", 
    style: Theme.of(context).textTheme.headlineMedium,
    );
  }
}