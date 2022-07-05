import 'package:flutter/material.dart';

import 'color_utility.dart';

textFieldNormal({
  String textFieldName = "",
  required TextEditingController controller,
}) {
  return Container(
    decoration: BoxDecoration(
        color: colorF6F6F6,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colorF6F6F6)),
    child: TextField(
      controller: controller,

      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none),
          hintText: textFieldName,
          hintStyle: TextStyle(color: colorBDBDBD)),
    ),
  );
}

passwordTextFienld(
    {String textFieldName = "", required TextEditingController controller}) {
  return Container(
    decoration: BoxDecoration(
        color: colorF6F6F6,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colorF6F6F6)),
    child: TextField(
        controller: controller,
        obscureText: true,
        decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none),
            hintText: textFieldName,
            hintStyle: TextStyle(color: colorBDBDBD),
            suffix: Text(
              "Show",
              style: TextStyle(color: color5DB075, fontWeight: FontWeight.w600),
            ))),
  );
}

textFormField({
  String textFieldName = "",
  required TextEditingController controller,
}) {
  return Container(
    decoration: BoxDecoration(
        color: colorF6F6F6,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colorF6F6F6)),
    child: TextFormField(
      keyboardType: TextInputType.multiline,
      maxLines: 10,
      minLines: 8,
      controller: controller,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none),
          hintText: textFieldName,
          hintStyle: TextStyle(color: colorBDBDBD)),
    ),
  );
}
