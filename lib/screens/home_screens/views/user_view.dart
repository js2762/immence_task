import 'package:flutter/material.dart';

import '../../../data/app_colors.dart';

class UserView extends StatefulWidget {
  const UserView({super.key});

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding:  EdgeInsets.all(20.0),
                child:  Text(
                  "immence",
                  style: TextStyle(color: AppColors.appCommonColor, fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20,bottom: 20),
                child: Text(
                  "Users",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 3
                  ,itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                    elevation: 4,
                    color: Colors.white,
                    child: const ListTile(
                      leading: CircleAvatar(
                        radius: 25,
                        backgroundColor: AppColors.circleAvatarBgColor,
                        child: Text('J', style: TextStyle(color: AppColors.appCommonColor,fontSize: 27),),
                      ),
                      title: Text("John Smith"),
                      subtitle: Text("demo@gmail.com"),
                      trailing: CircleAvatar(
                        backgroundColor: AppColors.circleAvatarBgColor,
                        radius: 8,
                        child: CircleAvatar(
                          backgroundColor: AppColors.appCommonColor,
                          radius: 3,
                        ),
                      ),
                    ),
                  );
                },),
              )
            ],
          )
      ),
    );
  }
}
