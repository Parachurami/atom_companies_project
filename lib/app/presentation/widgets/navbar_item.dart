import 'package:flutter/material.dart';

class NavbarItem extends StatelessWidget {
  const NavbarItem({super.key, required this.icon, this.onPress, required this.isSelected});
  final Icon icon;
  final VoidCallback? onPress;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: onPress,
      child: Container(
        width: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: isSelected ? Colors.lightBlueAccent.withAlpha(200) : Colors.transparent
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon.icon,
            color: isSelected ? Colors.white : Colors.black,
            size: 30,
            ),
          ],
        ),
      )
    );
  }
}