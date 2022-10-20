import 'package:flutter/material.dart';

const kMainColor = Color(0xffD5ECC2);
const kPurpulColor = Color(0xff916BBF);
const kBlackColor = Colors.black;
final kMainColorShade = Colors.lightGreenAccent.shade700;
const kWhiteColor = Colors.white;

const kTextTitle = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
const kTextinformation = TextStyle(fontSize: 10);

const kMainMargin = EdgeInsets.symmetric(vertical: 10, horizontal: 20);

const kBoxLinearGradient = BoxDecoration(
  gradient: LinearGradient(
      colors: [
        const Color(0xffFFAAA7),
        const Color(0xffD5ECC2),
      ],
      begin: const FractionalOffset(0.0, 0.0),
      end: const FractionalOffset(1.0, 0.0),
      stops: [0.0, 1.0],
      tileMode: TileMode.clamp),
);

/*
Angela chat */
const kSendButtonTextStyle = TextStyle(
  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
  ),
);

final kInputDecoration = InputDecoration(
  hintText: 'Enter your email',
  hintStyle: TextStyle(color: Colors.black.withOpacity(0.6)),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);
