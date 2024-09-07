import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

/// data loaded
Widget dataLoaded({Color? color}) {
  return Center(
    child: SpinKitSpinningLines(color: color ?? Colors.black),
  );
}
