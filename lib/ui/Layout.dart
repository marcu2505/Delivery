import 'package:flutter/material.dart';

class Layout {
  static Widget render({
    Widget content,
    Widget floatingActionButton,
    Widget bottomNavigationBar,
  }) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: content,
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
