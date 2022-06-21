import 'package:flutter/material.dart';
import 'dart:async';

class LongPressFastChangeDetector extends StatefulWidget {
  LongPressFastChangeDetector(
      {required this.changeStateFunction, required this.child});

  final VoidCallback changeStateFunction;
  final Widget child;

  @override
  State<LongPressFastChangeDetector> createState() =>
      _LongPressFastChangeDetectorState();
}

class _LongPressFastChangeDetectorState
    extends State<LongPressFastChangeDetector> {
  Timer? _timer;

  bool _longPressCanceled = false;

  void _cancelChange() {
    if (_timer != null) {
      _timer!.cancel();
    }
    _longPressCanceled = true;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPressEnd: (LongPressEndDetails longPressEndDetails) {
        _cancelChange();
      },
      onLongPressUp: () {
        _cancelChange();
      },
      onLongPressMoveUpdate:
          (LongPressMoveUpdateDetails longPressMoveUpdateDetails) {
        if (longPressMoveUpdateDetails.localOffsetFromOrigin.distance > 50) {
          _cancelChange();
        }
      },
      onLongPress: () {
        _longPressCanceled = false;
        Future.delayed(Duration(milliseconds: 150), () {
          if (!_longPressCanceled) {
            _timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
              widget.changeStateFunction();
            });
          }
        });
      },
      child: widget.child,
    );
  }
}
