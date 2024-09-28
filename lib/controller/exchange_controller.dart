import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ExchangeController extends GetxController {
  // Method to handle currency exchange logic
  void calculateExchange();

  // Variables to hold dropdown values and result
  RxString valueChoose = ''.obs;
  RxString valueChoose1 = ''.obs;
  TextEditingController amountController = TextEditingController();
  TextEditingController resultController = TextEditingController();
}

class ExchangeControllerImpl extends ExchangeController {
  @override
  void calculateExchange() {
    double calc;
    double res;

    if (amountController.text.isEmpty) {
      resultController.text = "Please enter an amount";
      return;
    }

    double amount = double.parse(amountController.text);

    if (valueChoose.value == "USD" && valueChoose1.value == "EGP") {
      calc = amount * 48.30;
      res = calc;
    } else if (valueChoose.value == "USD" && valueChoose1.value == "QAR") {
      calc = amount * 3.64;
      res = calc;
    } else if (valueChoose.value == "USD" && valueChoose1.value == "USD") {
      calc = amount * 1;
      res = calc;
    } else if (valueChoose.value == "USD" && valueChoose1.value == "EUR") {
      calc = amount * 0.90;
      res = calc;
    } else if (valueChoose.value == "USD" && valueChoose1.value == "BHD") {
      calc = amount * 0.38;
      res = calc;
    } else if (valueChoose.value == "QAR" && valueChoose1.value == "QAR") {
      calc = amount * 1;
      res = calc;
    } else if (valueChoose.value == "QAR" && valueChoose1.value == "USD") {
      calc = amount * 0.27;
      res = calc;
    } else if (valueChoose.value == "QAR" && valueChoose1.value == "EUR") {
      calc = amount * 0.25;
      res = calc;
    } else if (valueChoose.value == "QAR" && valueChoose1.value == "EGP") {
      calc = amount * 8.37;
      res = calc;
    } else if (valueChoose.value == "QAR" && valueChoose1.value == "BHD") {
      calc = amount * 0.10;
      res = calc;
    } else if (valueChoose.value == "EUR" && valueChoose1.value == "EUR") {
      calc = amount * 1;
      res = calc;
    } else if (valueChoose.value == "EUR" && valueChoose1.value == "QAR") {
      calc = amount * 4.05;
      res = calc;
    } else if (valueChoose.value == "EUR" && valueChoose1.value == "USD") {
      calc = amount * 1.11;
      res = calc;
    } else if (valueChoose.value == "EUR" && valueChoose1.value == "EGP") {
      calc = amount * 34.50;
      res = calc;
    } else if (valueChoose.value == "EUR" && valueChoose1.value == "BHD") {
      calc = amount * 0.42;
      res = calc;
    } else if (valueChoose.value == "BHD" && valueChoose1.value == "BHD") {
      calc = amount * 1;
      res = calc;
    } else if (valueChoose.value == "BHD" && valueChoose1.value == "EUR") {
      calc = amount * 2.35;
      res = calc;
    } else if (valueChoose.value == "BHD" && valueChoose1.value == "USD") {
      calc = amount * 2.65;
      res = calc;
    } else if (valueChoose.value == "BHD" && valueChoose1.value == "QAR") {
      calc = amount * 9.60;
      res = calc;
    } else if (valueChoose.value == "BHD" && valueChoose1.value == "EGP") {
      calc = amount * 128.6;
      res = calc;
    } else if (valueChoose.value == "EGP" && valueChoose1.value == "EGP") {
      calc = amount * 1;
      res = calc;
    } else if (valueChoose.value == "EGP" && valueChoose1.value == "USD") {
      calc = amount * 0.02;
      res = calc;
    } else if (valueChoose.value == "EGP" && valueChoose1.value == "EUR") {
      calc = amount * 0.018;
      res = calc;
    } else if (valueChoose.value == "EGP" && valueChoose1.value == "BHD") {
      calc = amount * 0.0078;
      res = calc;
    } else if (valueChoose.value == "EGP" && valueChoose1.value == "QAR") {
      calc = amount * 0.075;
      res = calc;
    } else {
      resultController.text = "Invalid, please choose currencies first";
      return;
    }

    resultController.text = res.toString();
  }
}
