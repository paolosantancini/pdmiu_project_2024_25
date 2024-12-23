import 'package:flutter/material.dart'; // Android layout
import 'package:fluttertoast/fluttertoast.dart';

// Box per feedback
class Toast {
  // Costruttore
  Toast(String msg) {
    _showToast(msg);
  }

  void _showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      gravity: ToastGravity.BOTTOM_RIGHT,
      textColor: Colors.white,
      backgroundColor: Colors.black,
    );
  }
}
