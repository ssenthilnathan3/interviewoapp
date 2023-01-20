import 'package:flutter/material.dart';
import 'package:interviewo/components/drawer/bottom_user_info.dart';
import 'package:interviewo/components/drawer/cutom_list_tile.dart';
import 'package:interviewo/components/drawer/header.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  Widget _buildTile(icon, title, route) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomListTile(icon: icon, title: title, route: route),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AnimatedContainer(
        curve: Curves.easeInOutCubic,
        duration: const Duration(milliseconds: 500),
        width: 300,
        margin: const EdgeInsets.only(bottom: 10, top: 10),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          color: Color.fromRGBO(20, 20, 20, 1),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomDrawerHeader(),
              const Divider(
                color: Colors.grey,
              ),
              _buildTile(Icons.home_outlined, "For Enterprise", '/home'),
              _buildTile(Icons.calendar_today, "For Universities", '/explore'),
              _buildTile(Icons.pin_drop, "For Employers", '/discover'),
              const Divider(color: Colors.grey),
              const Spacer(),
              _buildTile(Icons.settings, "Settings", '/home'),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
