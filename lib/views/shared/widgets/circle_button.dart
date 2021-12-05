import 'package:flutter/material.dart';
import 'package:iloveyoucleanwater/utils/constants.dart';

class CircleButton extends StatelessWidget {
  final Color colors;
  final IconData icon;
  final VoidCallback onTap;
  CircleButton({required this.colors, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: Text("btn2"),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(25.0),
        child: Container(
          width: 50.0,
          height: 50.0,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: Card(
            elevation: 1.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: Icon(
              icon,
              color: colors,
              size: 15.0,
            ),
          ),
        ),
      ),
    );
  }
}

class FloatingAction extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  FloatingAction({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: Text("btn1"),
      onPressed: onTap,
      child: Container(
        width: 50.0,
        height: 50.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: Card(
          elevation: 1.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          child: Icon(
            icon,
            color: kGrey2,
            size: 15.0,
          ),
        ),
      ),
    );
  }
}
