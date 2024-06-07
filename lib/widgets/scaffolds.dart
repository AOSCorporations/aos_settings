import 'package:aos_settings/widgets/window.dart';
import 'package:flutter/material.dart';

class IPageScaffold extends StatefulWidget {
  const IPageScaffold(
      {super.key, this.titlebar, this.backgroundColor, this.body});
  final PreferredSizeWidget? titlebar;
  final Widget? body;
  final Color? backgroundColor;

  @override
  State<IPageScaffold> createState() => _IPageScaffoldState();
}

class _IPageScaffoldState extends State<IPageScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.titlebar,
      body: widget.body,
      backgroundColor: widget.backgroundColor,
    );
  }
}
