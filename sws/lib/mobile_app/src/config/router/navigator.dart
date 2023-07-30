import 'package:flutter/material.dart';

void go(BuildContext context, Widget page) {
  Navigator.push(context, MaterialPageRoute(builder: (context) {
    return page;
  }));
}

void close(BuildContext context) {
  Navigator.pop(context);
}
