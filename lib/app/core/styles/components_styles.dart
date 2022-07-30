import 'package:flutter/material.dart';

class ComponentsStyles {
  //BoxDecoration
  static get backgroundLoginDecoration => const BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.white54,
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      );

  //InputText
  static get inputBorderBlack54 =>
      const OutlineInputBorder(borderSide: BorderSide(color: Colors.black54));

  //Container
  static get gradientAppbaContainer => Container(
    decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [Colors.yellow, Colors.green])),
      );

  //ButtonStyles
  static get greenButton =>
      ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.green));

  //TextStyles
  static get normal15White => const TextStyle(
      fontSize: 15, color: Colors.white, fontWeight: FontWeight.normal);
  static get bold15Black35 => const TextStyle(
      fontSize: 15, color: Colors.black38, fontWeight: FontWeight.bold);
  static get bold15Black54 => const TextStyle(
      fontSize: 15, color: Colors.black54, fontWeight: FontWeight.bold);
  static get bold15Black87 => const TextStyle(
      fontSize: 15, color: Colors.black87, fontWeight: FontWeight.bold);
  static get bold15Black => const TextStyle(
      fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold);
  static get normal20Black => const TextStyle(
      fontSize: 20, color: Colors.black, fontWeight: FontWeight.normal);
  static get bold20Black54 => const TextStyle(
      fontSize: 20, color: Colors.black54, fontWeight: FontWeight.bold);
  static get bold20Black87 => const TextStyle(
      fontSize: 20, color: Colors.black87, fontWeight: FontWeight.bold);
  static get bold20Black => const TextStyle(
      fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold);
  static get normal15Blue => const TextStyle(
      fontSize: 15, color: Colors.blue, fontWeight: FontWeight.normal);
  static get normal20Blue => const TextStyle(
      fontSize: 20, color: Colors.blue, fontWeight: FontWeight.normal);
  static get normal25Blue => const TextStyle(
      fontSize: 30, color: Colors.blue, fontWeight: FontWeight.normal);
  static get regurlar13Black => const TextStyle(fontSize: 13, color: Colors.black);
}