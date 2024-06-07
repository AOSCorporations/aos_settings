import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

class IVisualEffectView extends StatefulWidget {
  const IVisualEffectView(
      {super.key,
      required this.child,
      this.material = IVisualEffectViewMaterial.Sidebar});
  final IVisualEffectViewMaterial material;
  final Widget child;

  @override
  State<IVisualEffectView> createState() => _IVisualEffectViewState();
}

enum IVisualEffectViewMaterial { Sidebar, UnderPage, ContextMenu, InAppSidebar }

class _IVisualEffectViewState extends State<IVisualEffectView>
    with WindowListener {
  bool focused = true;
  @override
  void initState() {
    super.initState();
    windowManager.addListener(this);
  }

  @override
  void dispose() {
    super.dispose();
    windowManager.removeListener(this);
  }

  @override
  void onWindowBlur() {
    setState(() {
      focused = false;
    });
  }

  @override
  void onWindowFocus() {
    setState(() {
      focused = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: widget.material == IVisualEffectViewMaterial.Sidebar
            ? ImageFilter.blur(sigmaX: 0, sigmaY: 0)
            : ImageFilter.blur(sigmaX: 0, sigmaY: 0),
        child: CustomPaint(
          painter: IVisualEffectViewPainter(
            isBackground: true,
            darkMode:
                Theme.of(context).brightness == Brightness.dark ? true : false,
          ),
          child: Container(
            color: focused == true
                ? Colors.transparent
                : Theme.of(context).colorScheme.surfaceVariant,
            child: widget.child,
          ),
        ),
      ),
    );
  }
}

class IVisualEffectViewPainter extends CustomPainter {
  // vars
  final bool darkMode;
  final bool isBackground;
  final double opacity;

  // const
  const IVisualEffectViewPainter({
    required this.darkMode,
    required this.isBackground,
    this.opacity = 0.8,
  });

  // painter
  @override
  Future<void> paint(Canvas canvas, Size size) async {
    final Color darkModeColor = const Color(0xff1C1C1E).withOpacity(opacity);
    final Color lightModeColor = const Color(0xfffafafa).withOpacity(opacity);

    /* canvas.drawColor(
      darkMode ? _darkModeColor : _lightModeColor,
      BlendMode.luminosity,
    ); */
    const Color red = Color(0x00ff0000);
    const Color green = Color(0x0000ff00);
    const Color blue = Color(0x000000ff);
    if (isBackground) {
      canvas.drawColor(red.withOpacity(0.2), BlendMode.luminosity);
      canvas.drawColor(green.withOpacity(0.2), BlendMode.luminosity);
      canvas.drawColor(blue.withOpacity(0.2), BlendMode.luminosity);
      canvas.drawColor(red.withOpacity(0.025), BlendMode.saturation);
      canvas.drawColor(green.withOpacity(0.025), BlendMode.saturation);
      canvas.drawColor(blue.withOpacity(0.0245), BlendMode.saturation);
      canvas.drawColor(Colors.black.withOpacity(0.2), BlendMode.darken);
    }
    darkMode
        ? canvas.drawColor(darkModeColor, BlendMode.darken)
        : canvas.drawColor(lightModeColor, BlendMode.lighten);
  }

  @override
  bool shouldRepaint(covariant IVisualEffectViewPainter oldDelegate) {
    return darkMode != oldDelegate.darkMode;
  }
}
