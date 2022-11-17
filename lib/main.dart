import 'package:flutter/material.dart';
import 'package:proform3/src/app.dart';
import 'package:proform3/src/helpers/api_helper.dart';
import 'package:proform3/src/web_service/api_routes.dart';

void main() {
  ApiHelper.initialize();
  runApp(const MyApp());
}
