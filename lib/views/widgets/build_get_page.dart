import 'package:flutter/material.dart';
import 'package:get/get.dart';

GetPage createGetPage({
  String? name,
  Widget? page,
  Object? args,
}) {
  return GetPage(
    name: name!,
    page: () => page!,
    transition: Transition.noTransition,
    arguments: args,
  );
}
