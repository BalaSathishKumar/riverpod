import 'package:flutter/material.dart';
import 'package:ofcriverpod/constants/colors.dart';
import 'package:ofcriverpod/utils/common_textstyles.dart';

class CheckboxDesign extends StatefulWidget {
  final String title;
  final List<String> strings;

  CheckboxDesign({required this.title, required this.strings});

  @override
  _CheckboxDesignState createState() => _CheckboxDesignState();
}

class _CheckboxDesignState extends State<CheckboxDesign> {
  List<bool> checkboxValues = List.generate(3, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: CustomTextStyle.txt18Rbblkbld,
        ),
        SizedBox(height: 16),
        for (int i = 0; i < widget.strings.length; i++)
          buildCheckboxRow(i),
      ],
    );
  }

  Widget buildCheckboxRow(int index) {
    return Row(
      children: [
        Checkbox(
          activeColor: Appcolors.dashpurple,
          value: checkboxValues[index],
          onChanged: (value) {
            setState(() {
              checkboxValues[index] = value!;
            });
          },
        ),
        SizedBox(width: 4),
        Text(widget.strings[index],style: CustomTextStyle.txt12Rbblkbld,),
      ],
    );
  }
}