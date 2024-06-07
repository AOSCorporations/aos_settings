import 'package:aos_settings/widgets/visualEffectView.dart';
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';
import 'package:yaru_window/yaru_window.dart';

class ISidebar extends StatelessWidget {
  const ISidebar({super.key, this.backgroundColor, this.title});
  final Color? backgroundColor;
  final Widget? title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: MediaQuery.of(context).size.height,
      child: IVisualEffectView(
          child: Expanded(
        child: Navigator(
          onGenerateRoute: (settings) => MaterialPageRoute(
              builder: (context) => Scaffold(
                    backgroundColor: Colors.transparent,
                    appBar: AppBar(
                        title: title,
                        forceMaterialTransparency: true,
                        flexibleSpace: GestureDetector(
                          onPanStart: (details) async {
                            YaruWindow.drag(context);
                            print("hi");
                          },
                          child: Container(),
                        )),
                  )),
        ),
      )),
      decoration: BoxDecoration(
          color: backgroundColor?.withOpacity(0.5) ??
              Theme.of(context).colorScheme.surfaceTint.withOpacity(0.1),
          border: Border(
              right: BorderSide(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Color(0xff606061)
                      : Color(0xffbababa)))),
    );
  }
}
