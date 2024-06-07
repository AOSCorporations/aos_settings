import 'package:flutter/material.dart';
import 'package:yaru_window/yaru_window.dart';

class AOSWindow extends StatefulWidget {
  const AOSWindow(
      {super.key,
      this.backgroundColor,
      this.sidebar,
      this.blurOrTransparencyEnabled = false,
      this.content,
      this.titleBarHidden = true});

  final Color? backgroundColor;
  final Widget? sidebar;
  final Widget? content;
  final bool titleBarHidden;
  final bool blurOrTransparencyEnabled;

  static void toggleSidebar(BuildContext context) {
    context.findAncestorStateOfType<_AOSWindowState>()?.toggleSidebar();
  }

  @override
  State<AOSWindow> createState() => _AOSWindowState();
}

class _AOSWindowState extends State<AOSWindow> {
  bool sidebarOpen = true;
  bool isAnimated = false;

  @override
  void initState() {
    super.initState();
    if (widget.blurOrTransparencyEnabled == true) {
      YaruWindow.setBackground(context, Colors.transparent);
    } else {
      YaruWindow.setBackground(context, Colors.black);
    }
    if (widget.titleBarHidden == true) {
      YaruWindow.hideTitle(context);
    } else {
      YaruWindow.showTitle(context);
    }
  }

  Future<void> toggleSidebar() async {
    if (sidebarOpen == true) {
      Future.delayed(Duration(milliseconds: 1), () {
        setState(() {
          isAnimated = true;
        });
      });
      Future.delayed(Duration(milliseconds: 15), () {
        setState(() {
          sidebarOpen = false;
        });
      });
      Future.delayed(Duration(milliseconds: 200), () {
        setState(() {
          isAnimated = false;
        });
      });
    } else {
      Future.delayed(Duration(milliseconds: 1), () {
        setState(() {
          isAnimated = true;
        });
      });
      Future.delayed(Duration(milliseconds: 15), () {
        setState(() {
          sidebarOpen = true;
        });
      });
      Future.delayed(Duration(milliseconds: 200), () {
        setState(() {
          isAnimated = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.sidebar ?? Container(),
        Container(
          color: widget.backgroundColor ??
              Theme.of(context).colorScheme.background,
        ),
        Align(
          alignment: Alignment.topRight,
          child: Container(
            width: MediaQuery.of(context).size.height - 300,
            height: MediaQuery.of(context).size.height,
            color: Theme.of(context).colorScheme.background,
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child:
              widget.sidebar == null || MediaQuery.of(context).size.width < 600
                  ? Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: widget.content ??
                          FilledButton(
                            child: Text("Press"),
                            onPressed: () async {
                              await toggleSidebar();
                            },
                          ),
                    )
                  : isAnimated == true
                      ? AnimatedSize(
                          curve: Curves.easeInOut,
                          duration: Duration(milliseconds: 200),
                          child: Container(
                            width: sidebarOpen == true
                                ? MediaQuery.of(context).size.width - 300
                                : MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            child: widget.content ??
                                FilledButton(
                                  child: Text("Press"),
                                  onPressed: () async {
                                    await toggleSidebar();
                                  },
                                ),
                          ),
                        )
                      : Container(
                          width: sidebarOpen == true
                              ? MediaQuery.of(context).size.width - 300
                              : MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          child: widget.content ??
                              FilledButton(
                                child: Text("Press"),
                                onPressed: () async {
                                  await toggleSidebar();
                                },
                              ),
                        ),
        ),
      ],
    );
  }
}
