import 'package:flutter/material.dart';

class WorkPage extends StatefulWidget {
  const WorkPage({super.key});

  @override
  State<WorkPage> createState() => _WorkPageState();
}

class _WorkPageState extends State<WorkPage> {
  TextEditingController controller = TextEditingController();
  bool? isChecked = true;
  bool? isChecked1 = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Input your text here!"),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            onEditingComplete: () {
              setState(() {});
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Wrap(
            children: [
              Text(
                controller.text,
                style: TextStyle(
                  color: Colors.pink,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Checkbox(
          tristate: true,
          value: isChecked1,
          onChanged: (bool? value) {
            setState(() {
              isChecked1 = value;
            });
          },
        ),
        CheckboxListTile(
          title: Row(
            children: [
              Text("Hello world"),
              Icon(Icons.mobile_friendly),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [Text("Hellow")],
                ),
              ),
            ],
          ),
          tristate: true,
          value: isChecked,
          onChanged: (bool? value) {
            setState(() {
              isChecked = value;
            });
          },
        ),
      ],
    );
  }
}
