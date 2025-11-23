import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
  ThemeData get theme => Theme.of(this);

  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  // Push a new route onto the navigator stack and replace the current route
  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(
      this,
    ).pushReplacementNamed(routeName, arguments: arguments);
  }

  // Push a new route onto the navigator stack and remove all previous routes
  Future<dynamic> pushNamedAndRemoveUntil(
    String routeName, {
    Object? arguments,
    required RoutePredicate predicate,
  }) {
    return Navigator.of(
      this,
    ).pushNamedAndRemoveUntil(routeName, predicate, arguments: arguments);
  }

  void pop() => Navigator.of(this).pop();

  /// Applies equal padding on all sides.
  EdgeInsets all(double value) => EdgeInsets.all(value);

  /// Applies horizontal padding (left and right).
  EdgeInsets horizontal(double value) =>
      EdgeInsets.symmetric(horizontal: value);

  /// Applies vertical padding (top and bottom).
  EdgeInsets vertical(double value) => EdgeInsets.symmetric(vertical: value);

  /// Applies padding only to the top.
  EdgeInsets top(double value) => EdgeInsets.only(top: value);

  EdgeInsets bottom(double value) => EdgeInsets.only(bottom: value);

  EdgeInsets left(double value) => EdgeInsets.only(left: value);

  EdgeInsets right(double value) => EdgeInsets.only(right: value);

  EdgeInsets only({
    double top = 0,
    double bottom = 0,
    double left = 0,
    double right = 0,
  }) => EdgeInsets.only(top: top, bottom: bottom, left: left, right: right);

  EdgeInsets symmetric({double horizontal = 0, double vertical = 0}) =>
      EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical);
}
