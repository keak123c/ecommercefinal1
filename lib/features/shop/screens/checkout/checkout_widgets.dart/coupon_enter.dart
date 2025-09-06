import 'package:e_commerce/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class ECouponEnter extends StatelessWidget {
  const ECouponEnter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunctions.isDarkMode(context);
    return ERoundedContainer(
      showBorder: true,
      backgroundColor: dark ? EColors.dark : EColors.white,
      padding: const EdgeInsets.only(top: ESizes.sm, bottom: ESizes.sm, right: ESizes.sm, left: ESizes.md),
      child: Row(
        children: [
          Flexible(
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: "Enter Promote Code here",
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
              style: TextStyle(color: EHelperFunctions.isDarkMode(context) ? EColors.white : EColors.black, fontSize: 16),
            )
          ),
          SizedBox(
            width: 80,
            child: OutlinedButton(
              onPressed: (){}, 
              style: OutlinedButton.styleFrom(
                foregroundColor: dark ? EColors.dark : EColors.white,
                backgroundColor: dark ? EColors.white : EColors.dark,
                padding: const EdgeInsets.all(ESizes.md),
                side: BorderSide(color: dark ? EColors.white : EColors.dark),
              ),
              child: const Text("Enter"),
            )
          )
        ],
      ),
    );
  }
}