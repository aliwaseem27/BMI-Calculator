import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/components/round_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/long_press_fast_change_detector.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.male;
  int height = 170;
  int weight = 65;
  int age = 27;

  void increaseHeight() {
    if (height < kMaxHeight) {
      setState(() => height++);
    }
  }
  void decreaseHeight() {
    if (height > kMinHeight) {
      setState(() => height--);
    }
  }
  void increaseWeight() {
    if (weight < kMaxWeight) {
      setState(() => weight++);
    }
  }
  void decreaseWeight() {
    if (weight > kMinWeight) {
      setState(() => weight--);
    }
  }
  void increaseAge() {
    if (age < kMaxAge) {
      setState(() => age++);
    }
  }
  void decreaseAge() {
    if (age > kMinAge) {
      setState(() => age--);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    color: selectedGender == Gender.male
                        ? kActiveContainerColor
                        : kInactiveContainerColor,
                    cardChild: IconContent(
                      label: "MALE",
                      icon: FontAwesomeIcons.mars,
                      color: selectedGender == Gender.male
                          ? Colors.white
                          : Color(0xFF8D8E98),
                    ),
                  ),
                ),
                Expanded(
                    child: ReusableCard(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  color: selectedGender == Gender.female
                      ? kActiveContainerColor
                      : kInactiveContainerColor,
                  cardChild: IconContent(
                    label: "FEMALE",
                    icon: FontAwesomeIcons.venus,
                    color: selectedGender == Gender.female
                        ? Colors.white
                        : Color(0xFF8D8E98),
                  ),
                )),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              onPress: () {},
              color: kActiveContainerColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "HEIGHT",
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        "cm",
                        style: kLabelTextStyle,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      LongPressFastChangeDetector(
                        changeStateFunction: decreaseHeight,
                        child: RawMaterialButton(
                          onPressed: decreaseHeight,
                          child: Icon(FontAwesomeIcons.minus),
                          shape: CircleBorder(),
                          constraints: BoxConstraints.tightFor(
                            width: 56.0,
                            height: 56.0,
                          ),
                        ),
                      ),
                      Expanded(
                        child: SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 15.0),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 30.0),
                            thumbColor: kBottomContainerColor,
                            activeTrackColor: Colors.white,
                            overlayColor: Color(0x1FEB1555),
                            inactiveTrackColor: Color(0xFF8D8E98),
                          ),
                          child: Slider(
                            onChanged: (double newValue) {
                              setState(() {
                                height = newValue.round();
                              });
                            },
                            value: height.toDouble(),
                            min: kMinHeight,
                            max: kMaxHeight,
                            divisions: 100,
                          ),
                        ),
                      ),
                      LongPressFastChangeDetector(
                        changeStateFunction: increaseHeight,
                        child: RawMaterialButton(
                          onPressed: increaseHeight,
                          child: Icon(FontAwesomeIcons.plus),
                          shape: CircleBorder(),
                          constraints: BoxConstraints.tightFor(
                            width: 56.0,
                            height: 56.0,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {},
                    color: kActiveContainerColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "WEIGHT",
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            LongPressFastChangeDetector(
                              changeStateFunction: decreaseWeight,
                              child: RoundIconButton(
                                onPressed: decreaseWeight,
                                icon: FontAwesomeIcons.minus,
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            LongPressFastChangeDetector(
                              changeStateFunction: increaseWeight,
                              child: RoundIconButton(
                                onPressed: increaseWeight,
                                icon: FontAwesomeIcons.plus,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {},
                    color: kActiveContainerColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "AGE",
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            LongPressFastChangeDetector(
                              changeStateFunction: decreaseAge,
                              child: RoundIconButton(
                                onPressed: decreaseAge,
                                icon: FontAwesomeIcons.minus,
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            LongPressFastChangeDetector(
                              changeStateFunction: increaseAge,
                              child: RoundIconButton(
                                onPressed: increaseAge,
                                icon: FontAwesomeIcons.plus,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            buttonTitle: "CALCULATE",
            onTap: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: height, weight: weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    bmiResult: calc.calculateBMI(),
                    resultText: calc.getResults(),
                    interpretation: calc.getInterpretation(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
