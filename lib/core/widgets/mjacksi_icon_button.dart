import 'package:flutter/material.dart';

class MJacksiIconButton extends StatelessWidget {
  const MJacksiIconButton({
    super.key,
    required this.onTap,
    required this.icon,
    this.iconSize,
    this.foregroundColor = Colors.black,
    this.heroTag,
  });
  final VoidCallback onTap;
  final IconData icon;
  final double? iconSize;
  final Color foregroundColor;
  final Object? heroTag;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.small(
      onPressed: onTap,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadiusDirectional.all(Radius.circular(8)),
        side: BorderSide(
          color: Colors.grey.shade200,
          width: 1.5,
        ),
      ),
      backgroundColor: Colors.white,
      foregroundColor: foregroundColor,
      heroTag: heroTag,
      child: Icon(icon, size: iconSize),
    );
  }
}
