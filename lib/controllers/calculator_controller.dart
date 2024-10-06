import 'package:get/get.dart';

class CalculatorController extends GetxController {
  RxString displayValue = RxString('00:00');
  RxString firstTime = RxString('');
  RxString secondTime = RxString('');
  RxString timeInput = RxString('');
  RxString operator = RxString('');
  RxString history = RxString('');
  RxBool enteringSecondTime = RxBool(false);
  RxBool resultCalculated = RxBool(false);
  RxInt count = RxInt(0); // Count for time inputs, excluding operators

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  // Add number to time input and format as HH:MM
  void addNumber(String number) {
    if (timeInput.value.length < 4) {
      timeInput.value += number;
      formatTime();
    }
  }

  // Format the time input to display it in HH:MM format
  void formatTime() {
    String paddedInput = timeInput.value.padLeft(4, '0');
    String hours = paddedInput.substring(0, 2);
    String minutes = paddedInput.substring(2, 4);

    displayValue.value = '$hours:$minutes';
  }

  // Set the operator (+ or -), and save first time
  void setOperator(String op) {
    if (timeInput.value.isNotEmpty || displayValue.value != '00:00') {
      if (firstTime.isEmpty) {
        firstTime.value = displayValue.value;
        history.value += '${firstTime.value}$op'; // Append current time and operator to history
        count.value++; // Increment count only for the first time input
      } else {
        if (operator.value.isNotEmpty) {
          calculateTime(intermediate: true); // Calculate intermediate result
        }
        firstTime.value = displayValue.value; // After intermediate, set firstTime to current displayValue
        history.value += op; // Append operator only to history
      }
      operator.value = op; // Update the operator
      timeInput.value = ''; // Clear the input for the second time
      displayValue.value = '00:00';
      enteringSecondTime.value = true;
    }
  }

  // Perform the calculation
  // Perform the calculation
  void calculateTime({bool intermediate = false}) {
    if (firstTime.isNotEmpty && (timeInput.value.isNotEmpty || displayValue.value != '00:00') && operator.isNotEmpty) {
      secondTime.value = displayValue.value;
      history.value += secondTime.value; // Append second value to history
      count.value++; // Increment count for the second time input

      // Parse times into hours and minutes
      List<String> time1 = firstTime.value.split(':');
      List<String> time2 = secondTime.value.split(':');

      int hours1 = int.parse(time1[0]);
      int minutes1 = int.parse(time1[1]);
      int hours2 = int.parse(time2[0]);
      int minutes2 = int.parse(time2[1]);

      int resultHours = 0, resultMinutes = 0;

      // Perform the operation based on the operator
      if (operator.value == '+') {
        resultMinutes = minutes1 + minutes2;
        resultHours = hours1 + hours2 + (resultMinutes ~/ 60);
        resultMinutes = resultMinutes % 60;
      } else if (operator.value == '-') {
        resultMinutes = minutes1 - minutes2;
        resultHours = hours1 - hours2;
        if (resultMinutes < 0) {
          resultMinutes += 60;
          resultHours--;
        }
      }

      // Format and set the result
      displayValue.value = '${resultHours.toString().padLeft(2, '0')}:${resultMinutes.toString().padLeft(2, '0')}';

      // If this is a final calculation
      if (!intermediate) {
        history.value += '='; // Add the equals sign to the history
        firstTime.value = displayValue.value; // Set the result as the first time for future operations
        operator.value = ''; // Clear operator after calculation
      } else {
        // If it's an intermediate calculation, just clear the operator for the next operation
        operator.value = '';
      }

      // Reset the second time and input
      secondTime.value = '';
      enteringSecondTime.value = false;
      timeInput.value = '';

    } else {
      // Handle the case when user just presses equals without valid input
      if (firstTime.isNotEmpty) {
        displayValue.value = firstTime.value; // Show the previous first time
      }
      secondTime.value = '';
      enteringSecondTime.value = false;
      timeInput.value = '';

      if(operator.value.isNotEmpty){
        // Modify history to reflect the last operation properly
        if (history.value.isNotEmpty) {
          int lastIndex = history.value.lastIndexOf(operator.value);
          if (lastIndex != -1) {
            // Replace the last operator with "="
            String result = '${history.value.substring(0, lastIndex)}=';
            history.value = result;
            operator.value = ''; // Clear operator after calculation
          }
        }
      }
    }
  }


  // Clear the current input
  void clear() {
    timeInput.value = '';
    displayValue.value = '00:00';
  }

  // Clear everything (All Clear)
  void allClear() {
    firstTime.value = '';
    secondTime.value = '';
    operator.value = '';
    enteringSecondTime.value = false;
    timeInput.value = '';
    displayValue.value = '00:00';
    history.value = ''; // Clear history
    count.value = 0; // Reset count
  }
}
