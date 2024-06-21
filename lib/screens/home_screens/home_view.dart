import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:immence_task/data/app_images.dart';
import 'package:immence_task/screens/home_screens/views/profile_view.dart';
import 'package:immence_task/screens/home_screens/views/user_view.dart';

import '../../data/app_colors.dart';
import '../../widgets/top_indicator.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with SingleTickerProviderStateMixin {
  late TabController tabController;
  int bottomBarIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  Widget _buildBody(int bottomBarIndex) {
    switch (bottomBarIndex) {
      case 0:
        return const UserView();
      case 1:
        return const ProfileView();
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _buildBody(bottomBarIndex),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                spreadRadius: 1,
                blurRadius: 10,
                offset: Offset(0, -2),
              ),
            ],
          ),
          child: TabBar(
            indicator: TopIndicator(),
            onTap: (value) {
              bottomBarIndex = value;
              setState(() {});
            },
            controller: tabController,
            labelColor: AppColors.appCommonColor,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: AppColors.appCommonColor,
            unselectedLabelColor: AppColors.lightGreyColor,
            tabs: const [
              Tab(
                icon: Icon(Icons.group),
                text: 'Users',
              ),
              Tab(
                icon: Icon(Icons.person),
                text: 'Profile',
              )
            ],
          ),
        ),
      ),
    );
  }
}
