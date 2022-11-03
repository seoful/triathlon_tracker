import 'package:flutter/material.dart';


void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: new ThemeData(scaffoldBackgroundColor: const Color(0xFFE0F0FF)),
        home: Onbording()
    );
  }
}

class Onbording extends StatefulWidget {
  const Onbording({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _OnbordingState createState() => _OnbordingState();
}

List checkListItems = [
  {
    "id": 0,
    "value": false,
    "title": "Sprint (0.75/20/5km)",
  },
  {
    "id": 1,
    "value": false,
    "title": "Olympic (1.5/40/10km)",
  },
  {
    "id": 2,
    "value": false,
    "title": "O2 (3/80/20km)",
  },
  {
    "id": 3,
    "value": false,
    "title": "half ironman (1.9/90/21.0975km)",
  }
];

class LabeledCheckbox extends StatelessWidget {
  const LabeledCheckbox({
    super.key,
    required this.label,
    required this.padding,
    required this.value,
    required this.onChanged, required ListTileControlAffinity controlAffinity,
  });

  final String label;
  final EdgeInsets padding;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged(!value);
      },
      child: Padding(
        padding: padding,
        child: Row(
          children: <Widget>[
            Expanded(child: Text(label)),
            Checkbox(
              value: value,
              onChanged: (bool? newValue) {
                onChanged(newValue!);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _OnbordingState extends State<Onbording> {
  bool _isSelected = false;
  String selected = "";
  List checkListItems = [
    {
      "id": 0,
      "value": false,
      "title": "Sprint (0.75/20/5km)",
    },
    {
      "id": 1,
      "value": false,
      "title": "Olympic (1.5/40/10km)",
    },
    {
      "id": 2,
      "value": false,
      "title": "O2 (3/80/20km)",
    },
    {
      "id": 3,
      "value": false,
      "title": "half ironman (1.9/90/21.0975km)",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body:SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(top: 39),
              child: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: (){
                  Navigator.pop(context);
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(40.0))),
              child: const ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                child: LinearProgressIndicator(
                  minHeight: 5.0,
                  value: 0.9,
                  color: Color(0xFF4A4999),
                  backgroundColor: Colors.grey,
                ),
              ),
            ),
            Container(
              child: Text('Which distance do you preparing to?', style: TextStyle(fontSize: 28),),
              padding: EdgeInsets.only(top: 44, bottom:0, left:20, right:20),
            ),
            Container(
              child: Text("We need this to provide you the goals that you need to achive to be prepared for the distance. You can change it later in Settings", style: TextStyle(color: Colors.grey, fontSize:17 ),),
              padding: EdgeInsets.only(top: 24, bottom:0, left:20, right:20),
            ),
            Column(
              children: <Widget>[
                SizedBox(height: 50),
                  Column(
                      children: List.generate(
                        checkListItems.length,
                            (index) => CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          contentPadding: EdgeInsets.zero,
                          dense: true,
                          title: Text(
                            checkListItems[index]["title"],
                            style: const TextStyle(
                              fontSize: 20.0,
                              color: Colors.black,
                            ),
                          ),
                          value: checkListItems[index]["value"],
                          onChanged: (value) {
                            setState(() {
                              for (var element in checkListItems) {
                                element["value"] = false;
                              }
                              checkListItems[index]["value"] = value;
                              selected = "${checkListItems[index]["id"]}, ${checkListItems[index]["title"]}, ${checkListItems[index]["value"]}";
                            });
                          },
                        ),
                      ),
                  ),
              ],
            ),
            Container(

                alignment: Alignment.bottomCenter,
                padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 150),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Color(0xFF4A4999)),
                  child: Text('Continue  ➜'),
                  onPressed: (){},
                ),
            )
          ],
    ),
      ),
    );
  }
}