import 'package:flutter/material.dart';

customUploader(Function onTap) {
  return GestureDetector(
      child: Padding(
        padding: EdgeInsets.only(left: 10.0, right: 10.0),
        child: Container(
          height: 180,
          child: Center(
            child: Icon(
              Icons.add,
              size: 45.0,
            ),
          ),
          decoration: BoxDecoration(
              color: Colors.white12, borderRadius: BorderRadius.circular(10.0)),
        ),
      ),
      onTap: onTap);
}
