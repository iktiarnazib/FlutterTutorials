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
  bool isOn = true;
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
            onEditingComplete: () => setState(() {}),
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
        Checkbox.adaptive(
          tristate: true,
          value: isChecked1,
          onChanged: (value) {
            setState(() {
              isChecked1 = value;
            });
          },
        ),
        CheckboxListTile.adaptive(
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
        Switch.adaptive(
          value: isOn,
          onChanged: (bool value) {
            setState(() {
              isOn = value;
            });
          },
        ),
        SwitchListTile.adaptive(
          title: Row(
            children: [
              Icon(Icons.turned_in, color: Colors.amber),
              Text("Saved", style: TextStyle(fontSize: 20.0)),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [Text("Switch"), Icon(Icons.lock_clock)],
                ),
              ),
            ],
          ),
          value: isOn,
          onChanged: (bool value) {
            setState(() {
              isOn = value;
            });
          },
        ),
      ],
    );
  }
}
