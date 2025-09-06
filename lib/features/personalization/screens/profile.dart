

import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/common/widgets/images/rounded_image.dart';
import 'package:e_commerce/common/widgets/texts/section_heading.dart';
import 'package:e_commerce/features/personalization/screens/profile/profile_widgets/profile_menu.dart';
import 'package:e_commerce/utils/constants/image_string.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EAppBar(
        title: Text("Profile", style: Theme.of(context).textTheme.headlineMedium),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.all(ESizes.defaultSpace),
        child: Column(
          children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    const ERoundedImage(imageURL: EImage.userProfile, width: 80, height: 80, fit: BoxFit.cover, borderRadius: 80),
                    TextButton(onPressed: (){}, child: const Text("Change Profile Picture", style: TextStyle(color: Colors.blue))),
                  ],
                ),
              ), 
              const SizedBox(height: ESizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: ESizes.spaceBtwItems),
              const ESectionHeading(title: "Profile information", showActionButton: false),
              const SizedBox(height: ESizes.spaceBtwItems),

              ProfileMenu(title: "Name", value: "Fate Sakamoto", onPressed: (){}),
              ProfileMenu(title: "user name", value: "fate2020", onPressed: (){}),
              const SizedBox(height: ESizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: ESizes.spaceBtwItems),
              const ESectionHeading(title: "Personal information", showActionButton: false),
              const SizedBox(height: ESizes.spaceBtwItems),
              ProfileMenu(title: "User ID", value: "1843210741", onPressed: (){}),
              ProfileMenu(title: "Email", value: "fate2020@gmail.com", onPressed: (){}),
              ProfileMenu(title: "Phone number", value: "1234567890", onPressed: (){}),
              ProfileMenu(title: "Date of birth", value: "10 Jan 2003", onPressed: (){}),	
            ],
          ),
        ),
      )
    );
  }
}