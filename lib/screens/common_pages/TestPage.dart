import 'dart:typed_data';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/flutter_material_pickers.dart';
import 'package:file_picker/file_picker.dart';

class TestPage extends StatefulWidget {
  final PageController pageController;
  TestPage(this.pageController, {Key? key}) : super(key: key);

  @override
  _TestPageState createState() => _TestPageState(this.pageController);
}

class _TestPageState extends State<TestPage> {
  var model = ExampleModel();

  final PageController pageController;

  _TestPageState(this.pageController);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          title: const Text('Material Picker Examples'),
          actions: <Widget>[
            IconButton(
              icon: Theme.of(context).brightness == Brightness.dark
                  ? const Icon(Icons.brightness_7)
                  : const Icon(Icons.brightness_4),
              onPressed: () => AdaptiveTheme.of(context).toggleThemeMode(),
            )
          ],
          bottom: const TabBar(
            isScrollable: true,
            tabs: <Widget>[
              Tab(text: 'New Pickers'),
              Tab(text: 'Convenience Pickers'),
            ],
          ),
        ),
        body: SafeArea(
          child: Container(
            margin: const EdgeInsets.all(8.0),
            child: TabBarView(
              children: <Widget>[
                Card(
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView(
                      children: <Widget>[
                        buildEmptyRow(context),
                        const Divider(),
                        buildScrollRow(context),
                        const Divider(),
                        buildNumberRow(context),
                        const Divider(),
                        buildCheckboxRow(context),
                        const Divider(),
                        buildRadioRow(context),
                        const Divider(),
                        buildSelectionRow(context),
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView(
                      children: <Widget>[
                        buildTimeRow(context),
                        const Divider(),
                        buildDateRow(context),
                        const Divider(),
                        buildColorRow(context),
                        const Divider(),
                        buildPaletteRow(context),
                        const Divider(),
                        buildSwatchRow(context),
                        const Divider(),
                        buildFileRow(context),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row buildEmptyRow(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 150.0,
          child: ElevatedButton(
            child: const Text('Empty Dialog'),
            onPressed: () => showMaterialResponsiveDialog<void>(
              context: context,
              hideButtons: false,
              confirmText: 'Yes',
              cancelText: 'No',
              onConfirmed: () => print('Dialog confirmed'),
              onCancelled: () => print('Dialog cancelled'),
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(30.0),
                  child: RichText(
                    text: const TextSpan(
                      text:
                          'This is the base dialog widget for the pickers. Unlike the off-the-shelf Dialog widget, it handles landscape orientations. You may place any content here you desire.',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w700,
                      ),
                      children: <TextSpan>[
                        TextSpan(text: '\n\n'),
                        TextSpan(
                            text:
                                'This example has the button bar hidden, so you dismiss it by clicking outside the window.',
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w300)),
                        //TextSpan(text: 'your text',style: TextStyle(color: Colors.redAccent,fontSize: 38))
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        const Expanded(
          child: Text(
            'n/a',
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }

  Row buildScrollRow(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 150.0,
          child: ElevatedButton(
            child: const Text('Scroll Picker'),
            onPressed: () => showMaterialScrollPicker<PickerModel>(
              context: context,
              title: 'Pick Your City',
              showDivider: false,
              items: ExampleModel.usStates,
              selectedItem: model.selectedUsState,
              onChanged: (value) =>
                  setState(() => model.selectedUsState = value),
              onCancelled: () => print('Scroll Picker cancelled'),
              onConfirmed: () => print('Scroll Picker confirmed'),
            ),
          ),
        ),
        Expanded(
          child: Text(
            '${model.selectedUsState} (${model.selectedUsState.code})',
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }

  Row buildNumberRow(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 150.0,
          child: ElevatedButton(
            child: const Text('Number Picker'),
            onPressed: () => showMaterialNumberPicker(
              context: context,
              title: 'Pick a Number',
              maxNumber: 100,
              minNumber: 15,
              step: 5,
              confirmText: 'Count me in',
              cancelText: 'Negatory',
              selectedNumber: model.age,
              onChanged: (value) => setState(() => model.age = value),
            ),
          ),
        ),
        Expanded(
          child: Text(
            model.age.toString(),
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }

  Row buildCheckboxRow(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 150.0,
          child: ElevatedButton(
            child: const Text('Checkbox Picker'),
            onPressed: () => showMaterialCheckboxPicker<PickerModel>(
              context: context,
              title: 'Pick Your Toppings',
              items: ExampleModel.iceCreamToppings,
              selectedItems: model.selectedIceCreamToppings,
              onChanged: (value) =>
                  setState(() => model.selectedIceCreamToppings = value),
            ),
          ),
        ),
        Expanded(
          child: Text(
            model.selectedIceCreamToppings.toString(),
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }

  Row buildRadioRow(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 150.0,
          child: ElevatedButton(
            child: const Text('Radio Picker'),
            onPressed: () => showMaterialRadioPicker<PickerModel>(
              context: context,
              title: 'Pick Your City',
              items: ExampleModel.usStates,
              selectedItem: model.selectedUsState,
              onChanged: (value) =>
                  setState(() => model.selectedUsState = value),
            ),
          ),
        ),
        Expanded(
          child: Text(
            '${model.selectedUsState} (${model.selectedUsState.code})',
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }

  Row buildSelectionRow(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 150.0,
          child: ElevatedButton(
            child: const Text('Selection Picker'),
            onPressed: () => showMaterialSelectionPicker<PickerModel>(
              context: context,
              title: 'Starship Speed',
              items: ExampleModel.speedOptions,
              selectedItem: model.speed!,
              iconizer: (item) => item.icon,
              onChanged: (value) => setState(() => model.speed = value),
            ),
          ),
        ),
        Expanded(
          child: Text(
            '${model.speed} (${model.speed?.code})',
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }

  Row buildTimeRow(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 150.0,
          child: ElevatedButton(
            child: const Text('Time Picker'),
            onPressed: () => showMaterialTimePicker(
              context: context,
              selectedTime: model.time,
              onChanged: (value) => setState(() => model.time = value),
            ),
          ),
        ),
        Expanded(
          child: Text(
            MaterialLocalizations.of(context).formatTimeOfDay(model.time),
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }

  Row buildDateRow(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 150.0,
          child: ElevatedButton(
            child: const Text('Date Picker'),
            onPressed: () => showMaterialDatePicker(
              title: 'Pick a date',
              firstDate: DateTime(1990, 1, 1),
              lastDate: DateTime(2050, 12, 31),
              context: context,
              selectedDate: model.date,
              onChanged: (value) => setState(() => model.date = value),
            ),
          ),
        ),
        Expanded(
          child: Text(
            DateFormat.yMMMd().format(model.date),
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }

  Row buildColorRow(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 150.0,
          child: ElevatedButton(
            child: const Text('Color Picker'),
            onPressed: () => showMaterialColorPicker(
              context: context,
              selectedColor: model.color,
              onChanged: (value) => setState(() => model.color = value),
            ),
          ),
        ),
        Expanded(child: Container()),
        Container(
          height: 20.0,
          width: 100.0,
          decoration: BoxDecoration(
            color: model.color,
          ),
        ),
      ],
    );
  }

  Row buildPaletteRow(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 150.0,
          child: ElevatedButton(
            child: const Text('Palette Picker'),
            onPressed: () => showMaterialPalettePicker(
              context: context,
              selectedColor: model.palette,
              onChanged: (value) => setState(() => model.palette = value),
            ),
          ),
        ),
        Expanded(child: Container()),
        Container(
          height: 20.0,
          width: 100.0,
          decoration: BoxDecoration(
            color: model.palette,
          ),
        ),
      ],
    );
  }

  Row buildSwatchRow(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 150.0,
          child: ElevatedButton(
            child: const Text('Swatch Picker'),
            onPressed: () => showMaterialSwatchPicker(
              context: context,
              selectedColor: model.swatch,
              onChanged: (value) => setState(() => model.swatch = value),
            ),
          ),
        ),
        Expanded(child: Container()),
        Container(
          height: 20.0,
          width: 100.0,
          decoration: BoxDecoration(
            color: model.swatch,
          ),
        ),
      ],
    );
  }

  Row buildFileRow(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 150.0,
          child: ElevatedButton(
            child: const Text('File Picker'),
            onPressed: () => showMaterialFilePicker(
              context: context,
              fileType: FileType.image,
              onChanged: (value) => setState(() => model.file = value),
            ),
          ),
        ),
        Expanded(
          child: Text(
            '${model.file.bytes?.lengthInBytes} bytes',
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }
}

class ExampleModel {
  // Scroll/Radio Picker Model
  static const List<PickerModel> usStates = <PickerModel>[
    PickerModel('Alabama', code: 'AL'),
    PickerModel('Alaska', code: 'AK'),
    PickerModel('Arizona', code: 'AZ'),
    PickerModel('Arkansas', code: 'AR'),
    PickerModel('California', code: 'CA'),
    PickerModel('Colorado', code: 'CO'),
    PickerModel('Connecticut', code: 'CT'),
    PickerModel('Delaware', code: 'DE'),
    PickerModel('Florida', code: 'FL'),
    PickerModel('Georgia', code: 'GA'),
    PickerModel('Hawaii', code: 'HW'),
    PickerModel('Idaho', code: 'ID'),
    PickerModel('Illinois', code: 'IL'),
    PickerModel('Indiana', code: 'IN'),
    PickerModel('Iowa', code: 'IO'),
    PickerModel('Kansas', code: 'KA'),
    PickerModel('Kentucky', code: 'KE'),
    PickerModel('Louisiana', code: 'LO'),
    PickerModel('Maine', code: 'MA'),
    PickerModel('Maryland', code: 'ML'),
    PickerModel('Massachusetts', code: 'MA'),
    PickerModel('Michigan', code: 'MI'),
    PickerModel('Minnesota', code: 'MN'),
    PickerModel('Mississippi', code: 'MS'),
    PickerModel('Missouri', code: 'MO'),
    PickerModel('Montana', code: 'MO'),
    PickerModel('Nebraska', code: 'NE'),
    PickerModel('Nevada', code: 'NV'),
    PickerModel('New Hampshire', code: 'NH'),
    PickerModel('New Jersey', code: 'NJ'),
    PickerModel('New Mexico', code: 'NM'),
    PickerModel('New York', code: 'NY'),
    PickerModel('North Carolina', code: 'NC'),
    PickerModel('North Dakota', code: 'ND'),
    PickerModel('Ohio', code: 'OH'),
    PickerModel('Oklahoma', code: 'OK'),
    PickerModel('Oregon', code: 'OR'),
    PickerModel('Pennsylvania', code: 'PA'),
    PickerModel('Rhode Island', code: 'RI'),
    PickerModel('South Carolina', code: 'SC'),
    PickerModel('South Dakota', code: 'SD'),
    PickerModel('Tennessee', code: 'TN'),
    PickerModel('Texas', code: 'TX'),
    PickerModel('Utah', code: 'UT'),
    PickerModel('Vermont', code: 'VT'),
    PickerModel('Virginia', code: 'VA'),
    PickerModel('Washington', code: 'WA'),
    PickerModel('West Virginia', code: 'WV'),
    PickerModel('Wisconsin', code: 'WI'),
    PickerModel('Wyoming', code: 'WY'),
  ];
  PickerModel selectedUsState = usStates[0];

  // Checkbox Picker Model
  static const List<PickerModel> iceCreamToppings = <PickerModel>[
    PickerModel('Hot Fudge', code: 'FUDGE'),
    PickerModel('Sprinkles', code: 'SPRINK'),
    PickerModel('Caramel', code: 'CARM'),
    PickerModel('Oreos', code: 'OREO'),
    PickerModel('Peanut Butter', code: 'PB'),
    PickerModel('Cookie Dough', code: 'COOKIE'),
    PickerModel('Whipped Cream', code: 'WHIP'),
    PickerModel('Marshmallow', code: 'MARSH'),
    PickerModel('Nuts', code: 'NUTS'),
    PickerModel('Heath Bar', code: 'HEATH'),
    PickerModel('Butterscotch', code: 'SCOTCH'),
    PickerModel("m&m's", code: 'MM'),
    PickerModel('Gummy worms', code: 'GUMMY'),
    PickerModel('Fruit', code: 'FRUIT'),
  ];
  List<PickerModel> selectedIceCreamToppings = [
    iceCreamToppings[0],
    iceCreamToppings[5],
  ];

  // Selection Picker Model
  static const List<PickerModel> speedOptions = <PickerModel>[
    PickerModel('Light', code: 1, icon: Icon(Icons.sort)),
    PickerModel('Ridiculous', code: 2, icon: Icon(Icons.clear_all)),
    PickerModel('Ludicrous', code: 3, icon: Icon(Icons.swap_calls)),
    PickerModel('Plaid', code: 4, icon: Icon(Icons.select_all)),
  ];
  // ignore: avoid_init_to_null
  PickerModel? speed = null; // intentionally testing null

  // Number Picker Model
  var age = 25;

  // Time Picker Model
  var time = TimeOfDay.now();

  // Date Picker Model
  var date = DateTime.now();

  // Color Picker Model
  Color color = Colors.red;

  // Palette Picker Model
  Color palette = Colors.green;

  // Swatch Picker Model
  Color swatch = Colors.blue;

  // File Picker Model
  PlatformFile file = PlatformFile(
      name: 'somefile.ext',
      size: 1024 * 1024 * 15,
      bytes: Uint8List(1024 * 1024 * 15));
}
