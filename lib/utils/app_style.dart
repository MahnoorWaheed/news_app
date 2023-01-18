import 'package:flutter/material.dart';

const h1Style = TextStyle(
    fontSize: 60,
    color: Colors.black,
    fontFamily: "Panton",
    height: 1.4,
    fontWeight: FontWeight.w900);

const screenMainTitleStyle = TextStyle(
    fontSize: 18,
    color: Colors.black,
    fontFamily: "Panton",
    fontWeight: FontWeight.w600);

const h3Style = TextStyle(
    fontFamily: "Panton",
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: Colors.black);

const h4Style = TextStyle(
    fontFamily: "Panton",
    fontSize: 13,
    fontWeight: FontWeight.w500,
    color: Colors.black);

const h5Style = TextStyle(
    fontFamily: "Panton",
    fontSize: 10,
    fontWeight: FontWeight.w300,
    color: Colors.black);

const h6Style = TextStyle(
    fontSize: 32,
    color: Colors.black,
    fontFamily: "Panton",
    fontWeight: FontWeight.w600);

const bodyStyle1 = TextStyle(
    fontFamily: "Panton",
    fontSize: 18,
    fontWeight: FontWeight.w100,
    color: Colors.black);

final textFieldStyle = OutlineInputBorder(
  borderRadius: BorderRadius.circular(25),
  borderSide: BorderSide(color: Colors.grey.shade900, width: 1.0),
);

final errorTextFieldStyle = OutlineInputBorder(
    borderRadius: BorderRadius.circular(25),
    borderSide: const BorderSide(color: Colors.red, width: 1));