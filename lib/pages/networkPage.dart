import 'package:aos_settings/widgets/scaffolds.dart';
import 'package:aos_settings/widgets/window.dart';
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

class NetworkPage extends StatefulWidget {
  const NetworkPage({super.key});

  @override
  State<NetworkPage> createState() => _NetworkPageState();
}

class _NetworkPageState extends State<NetworkPage> {
  @override
  Widget build(BuildContext context) {
    return IPageScaffold(
      titlebar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.view_sidebar_outlined),
          onPressed: () {
            AOSWindow.toggleSidebar(context);
          },
        ),
        title: Text("Networks"),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))],
        flexibleSpace: DragToMoveArea(
          child: Container(),
        ),
      ),
    );
  }
}
