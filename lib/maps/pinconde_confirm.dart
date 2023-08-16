import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:googlemaps/screens/welcome_screen.dart';

import 'pincode_locations.dart';

class PincodeConfirmWidget extends StatelessWidget {
  const PincodeConfirmWidget({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController pin1 = TextEditingController();
    TextEditingController pin2 = TextEditingController();
    TextEditingController pin3 = TextEditingController();
    TextEditingController pin4 = TextEditingController();
    TextEditingController pin5 = TextEditingController();
    TextEditingController pin6 = TextEditingController();

    String computeSingleValue() {
    String value1 = pin1.text;
    String value2 = pin2.text;
    String value3 = pin3.text;
    String value4 = pin4.text;
    String value5 = pin5.text;
    String value6 = pin6.text;
    return "$value1$value2$value3$value4$value5$value6";

    // Here, you can combine or transform the individual values as needed
    // For example, concatenating them
    // return '$value1 $value2 $value3 $value4 $value5 $value6';
  }

    final h = double.maxFinite;
    final w = double.maxFinite;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Confim a Pincode'),
      ),
      body: Container(
        height: h,
        width: w,
        color: Color.fromARGB(255, 220, 237, 202),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Form(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 40,
                        width: 30,
                        child: TextFormField(
                          controller: pin1,
                          onSaved: (pin1) {},
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: 40,
                        width: 30,
                        child: TextFormField(
                          controller: pin2,
                          onSaved: (pin2) {},
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: 40,
                        width: 30,
                        child: TextFormField(
                          controller: pin3,
                          onSaved: (pin3) {},
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: 40,
                        width: 30,
                        child: TextFormField(
                          controller: pin4,
                          onSaved: (pin4) {},
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: 40,
                        width: 30,
                        child: TextFormField(
                          controller: pin5,
                          onSaved: (pin5) {},
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: 40,
                        width: 30,
                        child: TextFormField(
                          controller: pin6,
                          onSaved: (pin6) {},
                          onChanged: (value) {
                            // if (value.length == 1) {
                            //   FocusScope.of(context).nextFocus();
                            // }
                          },
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Cancel'),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          String singleValue = computeSingleValue();
                          print('Single Value: $singleValue');
                          // print(computeSingleValue());
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                 LocationsPincodePostal(pincode: singleValue,),
                            ),
                          );
                        },
                        child: const Text('Confirm'),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
   
}
