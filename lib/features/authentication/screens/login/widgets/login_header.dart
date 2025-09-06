import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';


class TittleSubtitle extends StatelessWidget {
  const TittleSubtitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //title
          Text('Login', style: Theme.of(context).textTheme.headlineLarge),
          //gap
          const SizedBox(height: ESizes.sm),
          //subtitle
          Text('Please login to your account', style: Theme.of(context).textTheme.headlineMedium),
        ],
      ),
    );
  }
}

