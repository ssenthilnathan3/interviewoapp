import 'package:flutter/material.dart';
import 'package:interviewo/services/NavigationService.dart';
import 'package:interviewo/utils/Locator.dart';

class CustomListTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String route;

  CustomListTile({
    Key? key,
    required this.icon,
    required this.title,
    required this.route,
  }) : super(key: key);

  final NavigationService _navigationService = locator<NavigationService>();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          width: 300,
          height: 40,
          child: GestureDetector(
              child: Row(children: [
                Icon(
                  icon,
                  color: Colors.white10,
                  size: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(title,
                      style: TextStyle(
                          color: Colors.white10, fontWeight: FontWeight.bold)),
                ),
              ]),
              onTap: () {
                _navigationService.navigateTo(route);
              })),
    );
  }
}
