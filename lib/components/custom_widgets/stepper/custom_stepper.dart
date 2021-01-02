import 'package:engineering_thesis/components/custom_widgets/buttons/custom_button.dart';
import 'package:engineering_thesis/generated/l10n.dart';
import 'package:flutter/material.dart';

class CustomStepper extends StatefulWidget {
  final List<Step> steps;
  final bool nextActive;
  final bool cancelActive;
  CustomStepper(
      {@required this.steps,
      this.nextActive = false,
      this.cancelActive = false});

  @override
  _CustomStepperState createState() => _CustomStepperState();
}

class _CustomStepperState extends State<CustomStepper> {
  int currentStep = 0;
  bool complete = false;

  @override
  Widget build(BuildContext context) {
    return Stepper(
      controlsBuilder: (context, {onStepCancel, onStepContinue}) {
        if (!widget.cancelActive && !widget.nextActive) return Container();
        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if (widget.cancelActive)
              CustomButton.goToOtherScreen(
                  text: S.of(context).stepper_cancel_button_text,
                  onPressed: onStepCancel),
            if (widget.nextActive)
              CustomButton.goToOtherScreen(
                  text: S.of(context).stepper_next_button_text,
                  onPressed: onStepContinue)
          ],
        );
      },
      steps: widget.steps,
      physics: ClampingScrollPhysics(),
      currentStep: currentStep,
      onStepTapped: onStepTapped,
      onStepContinue: onStepContinue,
      onStepCancel: onStepCancel,
    );
  }

  void onStepTapped(int step) {
    setState(() {
      currentStep = step;
    });
  }

  void onStepContinue() {
    if (currentStep + 1 != widget.steps.length)
      onStepTapped(currentStep + 1);
    else {
      setState(() {
        complete = true;
      });
    }
  }

  void onStepCancel() {
    if (currentStep > 0) onStepTapped(currentStep - 1);
  }
}
