import 'package:flutter/material.dart';

class MovingButtonWithBottomBar extends StatefulWidget {
  @override
  _MovingButtonWithBottomBarState createState() => _MovingButtonWithBottomBarState();
}

class _MovingButtonWithBottomBarState extends State<MovingButtonWithBottomBar> with TickerProviderStateMixin {
  AnimationController? _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 500));
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: FloatingActionButton(
              onPressed: () {
                _animationController!.forward();
              },
              child: Icon(Icons.home),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 60,
              color: Colors.grey[300],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.home),
                  Icon(Icons.search),
                  Icon(Icons.person),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: AnimatedBuilder(
              animation: _animationController!,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(100 * _animationController!.value, 0),
                  child: child,
                );
              },
              child: Container(
                height: 60,
                color: Colors.transparent,
                child: Icon(Icons.home, size: 40, color: Colors.red),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
