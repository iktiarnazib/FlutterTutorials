import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  TextEditingController controller = TextEditingController();
  bool? isChecked = true;
  bool? isChecked1 = true;
  bool isOn = true;
  double isSlider = 0.0;
  String? isSelected;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings")),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            GestureDetector(
              onTap: () {
                print("This is slider");
              },
              child: Slider.adaptive(
                max: 10.0,
                divisions: 20,
                value: isSlider,
                onChanged: (double value) {
                  setState(() {
                    isSlider = value;
                  });
                  print(isSlider);
                },
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  print("The image has been clicked");
                });
              },
              child: Image.asset("assets/images/img.jpeg"),
            ),
            SizedBox(height: 20.0),
            InkWell(
              splashColor: Colors.purple,
              onTap: () {
                print("This is the container from InkWell widget");
                setState(() {});
              },
              child: Container(
                height: 200.0,
                width: double.infinity,
                color: Colors.white12,
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                print("Elevated button has been clicked!");
              },
              child: Text("Elevated Button"),
            ),
            FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                print("Filled button clicked");
              },
              child: Text("Filled button"),
            ),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                backgroundColor: Colors.yellow,
                foregroundColor: Colors.black,
              ),
              child: Text("Text Button"),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text("Elevated Button Normal"),
            ),
            FilledButton(onPressed: () {}, child: Text("Filled Button Normal")),
            TextButton(onPressed: () {}, child: Text("Text Button Normal")),
            OutlinedButton(
              onPressed: () {},
              child: Text("Outlined Button Simple"),
            ),
            BackButton(),
            CloseButton(),
            DropdownButton(
              value: isSelected,
              items: [
                DropdownMenuItem(value: "g1", child: Text("goo 1")),
                DropdownMenuItem(value: "g2", child: Text("goo 2")),
                DropdownMenuItem(value: "g3", child: Text("goo 3")),
              ],
              onChanged: (String? value) {
                setState(() {
                  isSelected = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
