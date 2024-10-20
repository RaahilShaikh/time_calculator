import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:my_calculator/utils/constants/constants.dart';

class CalculatorController extends GetxController {
  RxString displayValue = RxString('00:00');
  RxList<String> history = RxList([]);
  RxString currentOperation = RxString('');
  RxString lastOperation = RxString('');
  RxInt inputCount = RxInt(0);
  RxInt resultInMinutes = RxInt(0);
  RxString lastInput = RxString('');
  RxInt firstValueInMinutes = RxInt(0);
  RxBool isOperationSelected = RxBool(false);
  RxBool isEqualsPressed = RxBool(false);

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  // Helper to convert HH:MM input into minutes
  int convertToMinutes(String input) {
    input = input.padLeft(2, '0'); // Ensure at least 2 digits
    if (input.length <= 2) {
      // If input is 2 digits or less, it's considered as minutes only
      return int.parse(input);
    } else {
      // If input has more than 2 digits, treat it as HH:MM
      final hours = int.parse(input.substring(0, input.length - 2));
      final minutes = int.parse(input.substring(input.length - 2));
      return hours * 60 + minutes;
    }
  }

  // Convert minutes back to HH:MM
  String convertToHHMM(int totalMinutes) {
    final hours = (totalMinutes ~/ 60).toString();
    final minutes = (totalMinutes % 60).toString().padLeft(2, '0');
    return '$hours:$minutes';
  }

  // Handle input (when 1-9, 0, 00 are pressed)
  void onInput(String value) {
    if (!isEqualsPressed.value) {
      lastInput.value += value;

      // If the current operation is multiplication, display the raw value (as integer)
      if (currentOperation.value == StringConstants.lblMultiplication) {
        displayValue.value = lastInput.value; // Don't format as HH:MM for multiplication
      } else {
        // Otherwise, format as HH:MM for + and - operations
        displayValue.value = formatInput(lastInput.value);
      }

      inputCount.value++;
    }
  }

  // Format the input dynamically to HH:MM or just MM if only minutes are provided
  String formatInput(String input) {
    input = input.padLeft(2, '0'); // Ensure at least 2 digits
    if (input.length <= 2) {
      // If input is 2 digits or less, treat it as minutes only
      final minutes = input.padLeft(2, '0');
      return '00:$minutes'; // Display as 00:MM
    } else {
      // If input has more than 2 digits, treat it as HH:MM
      final minutes = input.substring(input.length - 2);
      final hours = input.substring(0, input.length - 2);
      return '$hours:$minutes'; // Display as HH:MM
    }
  }

// 00:55 x 8 + 00:75 + 11:11 x 5
  // Handle operator (+, -, x) click
  void onOperatorSelected(String operator) {
    lastOperation.value = currentOperation.value;
    // If equals was pressed, append to the last history entry and reset
    if (isEqualsPressed.value) {
      history.last = '${history.last} $operator';
      isEqualsPressed.value = false; // Reset equals flag
      lastInput.value = ''; // Clear the input for the next entry
    } else if (lastInput.isNotEmpty) {
      // When an input is present and an operator is selected
      if (currentOperation.isNotEmpty) {
        // Perform a calculation to chain the operations
        resultInMinutes.value = calculateResult();
        firstValueInMinutes.value = resultInMinutes.value;
      } else {
        // Store first value for the operation
        firstValueInMinutes.value = convertToMinutes(lastInput.value);
      }

      if (lastOperation.value == StringConstants.lblMultiplication) {
        history.add('${(lastInput.value)} $operator');
      } else {
        history.add('${formatInput(lastInput.value)} $operator');
      }
      // Add the current operation to the history
      // history.add('${formatInput(lastInput.value)} $operator');
      lastInput.value = ''; // Clear the input for the next entry
    } else {
      // If no input is present but an operator is already selected (switch operator case)
      if (history.isNotEmpty && currentOperation.isNotEmpty) {
        // Replace the last operator in the history
        history.last = history.last.replaceAll(currentOperation.value, operator);
      } else {
        // If there's no input and no operator yet, add to history with 0 as default input
        history.add('00:00 $operator');
      }
    }

    // Set the selected operator for the next operation
    currentOperation.value = operator;
    displayValue.value = '0'; // Reset display for new input
  }

  // Perform calculation with the current operation
  int calculateResult() {
    int secondValue;

    if (currentOperation.value == StringConstants.lblMultiplication) {
      // For multiplication, treat the last input as a raw integer
      secondValue = int.parse(lastInput.value); // Scalar value for multiplication
    } else {
      // For addition and subtraction, convert the input to minutes (HH:MM format)
      secondValue = convertToMinutes(lastInput.value);
    }

    if (currentOperation.value == StringConstants.lblPlus) {
      return firstValueInMinutes.value + secondValue;
    } else if (currentOperation.value == StringConstants.lblMinus) {
      return firstValueInMinutes.value - secondValue;
    } else if (currentOperation.value == StringConstants.lblMultiplication) {
      return firstValueInMinutes.value * secondValue;
    }
    return firstValueInMinutes.value;
  }

  // Handle '=' click to calculate and display the final result
  void onEquals() {
    if (lastInput.isNotEmpty && currentOperation.value.isNotEmpty) {
      resultInMinutes.value = calculateResult();

      // Update the history with the final result
      if (currentOperation.value == StringConstants.lblMultiplication) {
        history.add('${lastInput.value} = ${convertToHHMM(resultInMinutes.value)}');
      } else {
        history.add('${formatInput(lastInput.value)} = ${convertToHHMM(resultInMinutes.value)}');
      }

      // Display the final result in HH:MM format
      displayValue.value = convertToHHMM(resultInMinutes.value);

      // Set the result as the first value for the next operation
      firstValueInMinutes.value = resultInMinutes.value;

      // Update lastInput to the result for further chaining
      lastInput.value = convertToHHMM(resultInMinutes.value);

      // Reset the current operation
      currentOperation.value = '';
      isEqualsPressed.value = true; // Flag that equals was pressed
    }
  }

  // Handle C (clear current input)
  void onClear() {
    if (!isEqualsPressed.value) {
      lastInput.value = '';
      displayValue.value = '00:00';
    }
  }

  // Handle AC (all clear)
  void onAllClear() {
    lastInput.value = '';
    currentOperation.value = '';
    resultInMinutes.value = 0;
    firstValueInMinutes.value = 0;
    history.clear();
    displayValue.value = '00:00';
    isEqualsPressed.value = false;
  }
}
