import 'package:flutter/material.dart';

class socialActionBtn extends StatefulWidget {
  final IconData icon;
  final String? count;
  Color? iconColor;
  socialActionBtn({
    super.key,
    required this.icon,
     this.count,
    this.iconColor,
  });

  @override
  State<socialActionBtn> createState() => _socialActionBtnState();
}

class _socialActionBtnState extends State<socialActionBtn> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: const Color(0xFF2E2D2D).withOpacity(0.7),
          child: Center(
            child: Icon(widget.icon,
                color: widget.iconColor ?? Theme.of(context).primaryColorLight),
          ),
        ),
        widget.count != null
            ? Text(widget.count!, style: TextStyle(color: Colors.white))
            : SizedBox(),
      ],
    );
  }
}
