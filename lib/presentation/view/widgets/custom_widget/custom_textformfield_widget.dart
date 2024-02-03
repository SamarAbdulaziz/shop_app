import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget defaultTextForm({
  controller,
  labelText,
  dynamic icon,
  hintText,
  dynamic type,
  msg,
  dynamic visibleIcon,
  bool passwd = false,
  ValueChanged<String>? onSubmitted,
  GestureTapCallback? onTap
}) =>
    TextFormField(
      obscureText: passwd == false ? false : true,
      onFieldSubmitted: onSubmitted,
      controller: controller,
      keyboardType: type,
      validator: (String? value) {
        if (value!.isEmpty) {
          return '${msg}';
        }
      },
      decoration: InputDecoration(
        suffixIcon: InkWell(
          onTap: onTap,
          child: Icon(visibleIcon),
        ),
        contentPadding: const EdgeInsets.all(24),
        border:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: const BorderSide(),
        ),
        label: Text("${labelText}"),
        prefix: Icon(icon),
        hintText: "${hintText}",
      ),
    );
