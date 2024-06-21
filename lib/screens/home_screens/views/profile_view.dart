import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../data/app_colors.dart';
import '../../../data/app_images.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                margin: const EdgeInsets.all(20),
                alignment: Alignment.center,
                child: Image.asset(
                  AppImages.profileImage,
                  height: 141,
                  width: 141,
                )),
            const Text(
              "John Doe",
              style: TextStyle(color: AppColors.appCommonColor, fontSize: 36, fontWeight: FontWeight.w700),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
              elevation: 1,
              color: Colors.white,
              child: Container(
                padding: const EdgeInsets.all(20),
                child: const Row(
                  children: [
                    Text(
                      "Email",
                      style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    Spacer(),
                    Text(
                      "demo@gmail.com",
                      style: TextStyle(color: AppColors.appCommonColor, fontSize: 15, fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
              elevation: 1,
              color: Colors.white,
              child: Container(
                padding: const EdgeInsets.all(20),
                child: const Row(
                  children: [
                    Text(
                      "Phone No.",
                      style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    Spacer(),
                    Text(
                      "+91 1234567890",
                      style: TextStyle(color: AppColors.appCommonColor, fontSize: 15, fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
              elevation: 1,
              color: Colors.white,
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    const Text(
                      "Log out",
                      style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        FirebaseAuth.instance.signOut();
                        setState(() {});
                      },
                      child: const Icon(
                        Icons.logout,
                        color: AppColors.appCommonColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
