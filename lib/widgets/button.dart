// ignore_for_file: unnecessary_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SuperButton extends StatefulWidget {
  const SuperButton(
      {Key? key,
      required this.label,
      required this.icon,
      required this.onPress,
      required this.color})
      : super(key: key);
  final String label;
  final IconData icon;
  final Function()? onPress;
  final Color color;
  @override
  State<SuperButton> createState() => _SuperButtonState();
}

class _SuperButtonState extends State<SuperButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      label: Text(widget.label, style: const TextStyle(fontSize: 20)),
      icon: Icon(widget.icon, size: 25),
      onPressed: widget.onPress,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(widget.color),
        foregroundColor: MaterialStateProperty.all(Colors.white),
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
        ),
      ),
    );
  }
}
