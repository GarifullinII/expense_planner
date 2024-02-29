import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

class PlatformButton extends StatelessWidget {
  final Function handler;

  const PlatformButton({super.key, required this.handler});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
      onPressed: handler(),
      child: const Text(
        'Add transaction',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    )
        : ElevatedButton(
      onPressed: handler(),
      child: Text(
        'Add transaction',
        style: Theme.of(context).textTheme.titleSmall,
      ),
    );
  }
}
