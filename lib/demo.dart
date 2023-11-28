import 'package:flutter/material.dart';

class Avatar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Avatar();
}

class _Avatar extends State<Avatar> with TickerProviderStateMixin {
  late AnimationController _controller;
  Tween<double> _tween = Tween(begin: 0.75, end: 2);

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        duration: const Duration(milliseconds: 700), vsync: this);
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Align(
            child: ScaleTransition(
              scale: _tween.animate(CurvedAnimation(
                  parent: _controller, curve: Curves.elasticOut)),
              child: SizedBox(
                height: 100,
                width: 100,
                child: Container(
                  color: Colors.red,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
