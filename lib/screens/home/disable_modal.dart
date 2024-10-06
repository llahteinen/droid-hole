import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:droid_hole/widgets/option_box.dart';

class DisableModal extends StatefulWidget {
  final void Function(int) onDisable;
  final bool window;

  const DisableModal({
    Key? key,
    required this.onDisable,
    required this.window
  }) : super(key: key);

  @override
  State<DisableModal> createState() => _DisableModalState();
}

class _DisableModalState extends State<DisableModal> {
  int? selectedOption;
  TextEditingController customTimeController = TextEditingController();
  bool customTimeIsValid = false;

  final ExpandableController expandableController = ExpandableController();

  void _updateRadioValue(value) {
    setState(() {
      selectedOption = value;
      if (selectedOption != 5) {
        customTimeController.text = "";
        if (expandableController.expanded) expandableController.toggle();
      }
      else if (expandableController.expanded == false) {
        expandableController.toggle();
      }
    });
  }

  void _selectRadioValue(value) {
    _updateRadioValue(value);
    Navigator.pop(context);
    widget.onDisable(_getTime());
  }

  void _validateCustomMinutes(value) {
    if (int.tryParse(value) != null) {
      setState(() {
        customTimeIsValid = true;
      });
    }
    else {
      setState(() {
        customTimeIsValid = false;
      });
    }
  }

  bool _selectionIsValid() {
    if (selectedOption != null && selectedOption != 5) {
      return true;
    }
    else if (selectedOption == 5 && customTimeIsValid == true) {
      return true;
    }
    else {
      return false;
    }
  }

  int _getTime() {
    switch (selectedOption) {
      case 0:
        return 30; /// seconds30

      case 1:
        return 120; /// minutes2

      case 2:
        return 600; /// minutes10

      case 3:
        return 3600; /// hours1

      case 4:
        return 0; /// indefinitely

      case 5:
        return int.parse(customTimeController.text)*60; /// custom

      default:
        return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);

    Widget options() {
      return Wrap(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 16
                    ),
                    child: Icon(
                      Icons.gpp_bad_rounded,
                      size: 24,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      AppLocalizations.of(context)!.disable,
                      style: const TextStyle(
                        fontSize: 24
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          /// 30 seconds
          FractionallySizedBox(
            widthFactor: 0.5,
            child: Container(
              padding: const EdgeInsets.only(left: 16, right: 8, bottom: 8),
              child: OptionBox(
                optionsValue: selectedOption,
                itemValue: 0,
                onTap: _selectRadioValue,
                child: Center(
                  child: AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 250),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: selectedOption == 0
                        ? Theme.of(context).colorScheme.onSecondaryContainer
                        : Theme.of(context).colorScheme.onSurfaceVariant
                    ),
                    child: Text(AppLocalizations.of(context)!.seconds30),
                  ),
                ),
              ),
            ),
          ),
          /// 2 minutes
          FractionallySizedBox(
            widthFactor: 0.5,
            child: Container(
              padding: const EdgeInsets.only(right: 16, left: 8, bottom: 8),
              child: OptionBox(
                optionsValue: selectedOption,
                itemValue: 1,
                onTap: _selectRadioValue,
                child: Center(
                  child: AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 250),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: selectedOption == 1
                        ? Theme.of(context).colorScheme.onSecondaryContainer
                        : Theme.of(context).colorScheme.onSurfaceVariant
                    ),
                    child: Text(AppLocalizations.of(context)!.minutes2),
                  ),
                ),
              ),
            ),
          ),
          /// 10 minutes
          FractionallySizedBox(
            widthFactor: 0.5,
            child: Container(
              padding: const EdgeInsets.only(top: 8, left: 16, right: 8, bottom: 8),
              child: OptionBox(
                optionsValue: selectedOption,
                itemValue: 2,
                onTap: _selectRadioValue,
                child: Center(
                  child: AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 250),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: selectedOption == 2
                        ? Theme.of(context).colorScheme.onSecondaryContainer
                        : Theme.of(context).colorScheme.onSurfaceVariant
                    ),
                    child: Text(AppLocalizations.of(context)!.minutes10),
                  ),
                ),
              ),
            ),
          ),
          /// 1 hour
          FractionallySizedBox(
            widthFactor: 0.5,
            child: Container(
              padding: const EdgeInsets.only(top: 8, left: 8, right: 16, bottom: 8),
              child: OptionBox(
                optionsValue: selectedOption,
                itemValue: 3,
                onTap: _selectRadioValue,
                child: Center(
                  child: AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 250),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: selectedOption == 3
                        ? Theme.of(context).colorScheme.onSecondaryContainer
                        : Theme.of(context).colorScheme.onSurfaceVariant
                    ),
                    child: Text(AppLocalizations.of(context)!.hours1),
                  ),
                ),
              ),
            ),
          ),
          /// infinite
          FractionallySizedBox(
            widthFactor: 0.5,
            child: Container(
              padding: const EdgeInsets.only(top: 8, left: 16, right: 8),
              child: OptionBox(
                optionsValue: selectedOption,
                itemValue: 4,
                onTap: _selectRadioValue,
                child: Center(
                  child: AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 250),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: selectedOption == 4
                        ? Theme.of(context).colorScheme.onSecondaryContainer
                        : Theme.of(context).colorScheme.onSurfaceVariant
                    ),
                    child: Text(AppLocalizations.of(context)!.indefinitely),
                  ),
                ),
              ),
            ),
          ),
          /// Custom
          FractionallySizedBox(
            widthFactor: 0.5,
            child: Container(
              padding: const EdgeInsets.only(top: 8, left: 8, right: 16),
              child: OptionBox(
                optionsValue: selectedOption,
                itemValue: 5,
                onTap: _updateRadioValue,
                child: Center(
                  child: AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 250),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: selectedOption == 5
                        ? Theme.of(context).colorScheme.onSecondaryContainer
                        : Theme.of(context).colorScheme.onSurfaceVariant
                    ),
                    child: Text(AppLocalizations.of(context)!.custom),
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    }  

    Widget inputField() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 25),
            TextField(
              onChanged: _validateCustomMinutes,
              controller: customTimeController,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: false
              ),
              decoration: InputDecoration(
                errorText: !customTimeIsValid && customTimeController.text != ''
                  ? AppLocalizations.of(context)!.valueNotValid 
                  : null,
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10)
                  )
                ),
                labelText: AppLocalizations.of(context)!.customMinutes,
              ),
            ),
          ],
        ),
      );
    } 

    if (widget.window == true) {
      return Dialog(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 500
          ),
          child: Padding(
            padding: mediaQueryData.viewInsets,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: SingleChildScrollView(
                    child: Wrap(
                      children: [
                        ExpandableNotifier(
                          controller: expandableController,
                          child: Expandable(
                            collapsed: options(),
                            expanded: Column(
                              children: [
                                options(),
                                inputField()
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () => Navigator.pop(context), 
                        child: Text(AppLocalizations.of(context)!.cancel),
                      ),
                      const SizedBox(width: 20),
                      TextButton(
                        onPressed: _selectionIsValid() == true 
                          ? () {
                              Navigator.pop(context);
                              widget.onDisable(_getTime());
                            }
                          : null,
                        style: ButtonStyle(
                          foregroundColor: _selectionIsValid() == true 
                            ? MaterialStateProperty.all(Theme.of(context).colorScheme.primary)
                            : MaterialStateProperty.all(Colors.grey)
                        ),
                        child: Text(AppLocalizations.of(context)!.accept),
                      )
                    ]
                  ),
                )
              ],
            ),
          ),
        ),
      );
    }
    else {
      return Padding(
        padding: mediaQueryData.viewInsets,
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).dialogBackgroundColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(28),
              topRight: Radius.circular(28)
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: SingleChildScrollView(
                  child: Wrap(
                    children: [
                      ExpandableNotifier(
                        controller: expandableController,
                        child: Expandable(
                          collapsed: options(),
                          expanded: Column(
                            children: [
                              options(),
                              inputField()
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.pop(context), 
                      child: Text(AppLocalizations.of(context)!.cancel),
                    ),
                    const SizedBox(width: 20),
                    TextButton(
                      onPressed: _selectionIsValid() == true 
                        ? () {
                            Navigator.pop(context);
                            widget.onDisable(_getTime());
                          }
                        : null,
                      style: ButtonStyle(
                        foregroundColor: _selectionIsValid() == true 
                          ? MaterialStateProperty.all(Theme.of(context).colorScheme.primary)
                          : MaterialStateProperty.all(Colors.grey)
                      ),
                      child: Text(AppLocalizations.of(context)!.accept),
                    )
                  ]
                ),
              )
            ],
          ),
        ),
      );
    }
  }
}