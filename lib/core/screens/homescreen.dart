import 'package:flutter/material.dart';
import 'package:marwaha/core/shared/styles.dart';
import 'package:marwaha/core/shared/videoThumbnailUploader.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController synopsisController = TextEditingController();
  TextEditingController productionHouseNameController = TextEditingController();
  TextEditingController productionHouseContactController =
      TextEditingController();
  TextEditingController theTitleController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String productionHouseName = '';
  String productionHouseContactEmail = '';
  String title = '';
  String synopsis = '';

  var _types = ['Type A', 'Type B'];
  var _houses = ['Other', 'House 1', 'House 2', 'House 3'];

  String _currentTypeValue = 'Type A';
  String _currentHouseValue = 'Other';
  //To check the functionality of CheckBoxes
  bool noNudity = false;
  bool originalContent = false;
  bool futureScale = false;
  bool purposeRecognize = false;
  //
  //A snackBar to notify the action to the users
  showSnackBar(String content) {
    var snackBar = SnackBar(
        content: new Text(content,
            style: textStyle(13, FontWeight.w500, Colors.white)),
        backgroundColor: Colors.green,
        duration: Duration(milliseconds: 400));
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

//
  String selectedValue;
  String selectedValue2;
  String preselectedValue = "India";
  String preselectedValue2 = "Tamil";
  List<int> selectedItems = [];
  final List<DropdownMenuItem> items = [];

  List<int> selectedItems2 = [];
  final List<DropdownMenuItem> items2 = [];

  static const String appTitle = "Search Choices demo";
  final String countries =
      "India  Afghanistan  pakistan  Albania  Argentina  Algeria  Belize  Benin  China  Congo  Cuba  Fiji  Guam  Indonesia  Iran  Iraq  Kenya  Kiribati  Latvia  Libria  Mali  Malti  New Zealand  Niger  Pakistan  Saint Martin  Yemen  Zimbabwe";
  final String languages =
      " Tamil  English  Hindi  French  Spanish  Espanol  Bengali  Russian  portuguese  Urdu  Arabic  Japanese  German  Hindustani  Telugu  Malayalam  Kannadam  Chinese";

  @override
  void initState() {
    //Countries
    String wordPair = "";
    countries
        .toLowerCase()
        .replaceAll(",", "")
        .replaceAll(".", "")
        .split(" ")
        .forEach((word) {
      if (wordPair.isEmpty) {
        wordPair = word + " ";
      } else {
        wordPair += word;
        if (items.indexWhere((item) {
              return (item.value == wordPair);
            }) ==
            -1) {
          items.add(DropdownMenuItem(
            child: Text(wordPair),
            value: wordPair,
          ));
        }
        wordPair = "";
      }
    });
//Languages
    String wordPair2 = "";
    languages
        .toLowerCase()
        .replaceAll(",", "")
        .replaceAll(".", "")
        .split(" ")
        .forEach((word) {
      if (wordPair2.isEmpty) {
        wordPair2 = word + " ";
      } else {
        wordPair2 += word;
        if (items2.indexWhere((item) {
              return (item.value == wordPair2);
            }) ==
            -1) {
          items2.add(DropdownMenuItem(
            child: Text(wordPair2),
            value: wordPair2,
          ));
        }
        wordPair2 = "";
      }
    });
    //
    super.initState();
  }

//

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
          title: Center(
            child: Text(
              'Upload Videos',
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                print('Search Pressed');
              },
            )
          ]),
      drawer: Drawer(
        elevation: 10.0,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('DH'),
              decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                    image: AssetImage('assets/images/flutter.png'),
                    fit: BoxFit.contain),
              ),
            ),
            ListTile(
              title: Text('item 1'),
              leading: Icon(
                Icons.home,
                color: Colors.white,
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('item 2'),
              leading: Icon(
                Icons.attachment,
                color: Colors.white,
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('item 3'),
              leading: Icon(
                Icons.album,
                color: Colors.white,
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text(
                'item 4',
              ),
              leading: Icon(
                Icons.phone,
                color: Colors.white,
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 7.0, right: 7.0),
        color: Colors.black,
        child: Form(
          key: _formkey,
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: 10.0,
              ),

              Container(
                height: 70.0,
                child: TextFormField(
                    validator: (input) {
                      if (input.length < 6) {
                        return 'please provide a valid house name';
                      }
                    },
                    controller: theTitleController,
                    onSaved: (input) {
                      setState(() {
                        title = input;
                      });
                      title = input;
                    },
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      labelText: 'Title',
                    )),
              ),
              SizedBox(height: 10.0),
              //A custom dropdownButton with search options
              Container(
                  height: 85.0,
                  child: Column(children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(right: 300),
                      height: 15.0,
                      child: Text(
                        'Country',
                        style: textStyle(12, FontWeight.w400, Colors.white70),
                      ),
                    ),
                    SearchableDropdown.single(
                      items: items,
                      value: selectedValue,
                      hint: "Select a country",
                      searchHint: "Select a country",
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value;
                        });
                      },
                      isExpanded: true,
                    )
                  ])),
              // SizedBox(height: 10.0),
              //A normal dropDown menu
              Container(
                  height: 80.0,
                  child: InputDecorator(
                    decoration: InputDecoration(
                      labelText: 'Type',
                      errorStyle:
                          TextStyle(color: Colors.redAccent, fontSize: 16.0),
                      hintText: 'Type',
                    ),
                    isEmpty: _currentTypeValue == '',
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: _currentTypeValue,
                        isDense: true,
                        onChanged: (String newValue) {
                          setState(() {
                            _currentTypeValue = newValue;
                            // state.didChange(newValue);
                          });
                        },
                        items: _types.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  )),
              SizedBox(
                  height: 20.0), //SizedBox To give some space between widgets
              //A custom dropdownButton with search options
              Container(
                  height: 85.0,
                  child: Column(children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(right: 285),
                      height: 15.0,
                      child: Text(
                        'Languages',
                        style: textStyle(12, FontWeight.w400, Colors.white70),
                      ),
                    ),
                    SearchableDropdown.single(
                      items: items2,
                      value: selectedValue2,
                      hint: "Select a language",
                      searchHint: "Select a language",
                      onChanged: (value) {
                        setState(() {
                          selectedValue2 = value;
                        });
                      },
                      isExpanded: true,
                    )
                  ])),
              //

              SizedBox(height: 10),
              Container(
                height: 30,
                child: Text(
                  'Synopsis (Mandatory)',
                  style: textStyle(15, FontWeight.w300, Colors.white),
                ),
              ),
              //Container holding a multi line TextField
              Container(
                color: Colors.white10,
                height: 200.0,
                child: TextFormField(
                    maxLines: 30,
                    validator: (input) {
                      if (input.length < 6) {
                        return 'please provide a valid Synopsis';
                      }
                    },
                    controller: synopsisController,
                    onSaved: (input) {
                      setState(() {
                        synopsis = input;
                      });
                      synopsis = input;
                    },
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                        //labelText: 'Synopsis (Mandatory)',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)))),
              ),
              SizedBox(height: 10),

              //
              //Container holding the checklists
              Container(
                  child: CheckboxListTile(
                title: Text(
                    "Importantly, there is no nudity allowed at all and attempts will result in a loss of account and submission of cotent to local authorities for prosecution"),
                value: noNudity,
                onChanged: (newValue) {
                  setState(() {
                    noNudity = newValue;
                    if (noNudity)
                      print('Checked');
                    else
                      print('Unchecked');
                  });
                },
                controlAffinity:
                    ListTileControlAffinity.leading, //  <-- leading Checkbox
              )),
              SizedBox(height: 10),
              Container(
                  child: CheckboxListTile(
                title: Text(
                    'I agree to submit only my own original content and agree to be fined and cover all legal expenses of the company if I submit unoriginal or copyrighted material.'),
                value: originalContent,
                onChanged: (newValue) {
                  setState(() {
                    originalContent = newValue;
                    if (originalContent)
                      print('Checked');
                    else
                      print('Unchecked');
                  });
                },
                controlAffinity:
                    ListTileControlAffinity.leading, //  <-- leading Checkbox
              )),
              SizedBox(height: 10),
              Container(
                  child: CheckboxListTile(
                title: Text(
                    'I agree to allow to show my original content to their entire audience and to anyone including media outlets, to allow a future scale.'),
                value: futureScale,
                onChanged: (newValue) {
                  setState(() {
                    futureScale = newValue;
                    if (futureScale)
                      print('Checked');
                    else
                      print('Unchecked');
                  });
                },
                controlAffinity:
                    ListTileControlAffinity.leading, //  <-- leading Checkbox
              )),
              SizedBox(height: 10),
              Container(
                  child: CheckboxListTile(
                title: Text(
                    'All creators recognize that all the purpose of is to one,provide free original content to as large an audience as possible and two..'),
                value: purposeRecognize,
                onChanged: (newValue) {
                  setState(() {
                    purposeRecognize = newValue;
                    if (purposeRecognize)
                      print('Checked');
                    else
                      print('Unchecked');
                  });
                },
                controlAffinity:
                    ListTileControlAffinity.leading, //  <-- leading Checkbox
              )),
              SizedBox(height: 10),
              Container(
                child: Text(
                  'Upload Thumbnail',
                  style: textStyle(12, FontWeight.w300, Colors.white),
                ),
              ),
//
              SizedBox(height: 10),
              //A customized container with add icon button for uploading
              customUploader(
                () {
                  showSnackBar('Thumbnail Uploaded');
                  print('Upload Thumbnail');
                },
              ),
              SizedBox(height: 12),
              Container(
                height: 80.0,
                child: Row(
                  children: <Widget>[
                    Text(
                      'Upload Video',
                      style: textStyle(12, FontWeight.w300, Colors.white),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Container(
                          padding: EdgeInsets.only(top: 20.0),
                          height: 70.0,
                          child: Text(
                            '(Must be under 12 Minutes.Also note, it is our opinion that if the videos are not done in English, that the best chance to achieve maximum viewership is with subtitles)',
                            style: textStyle(10, FontWeight.w400, Colors.white),
                          )),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),

              //A customized container with add icon button for uploading
              customUploader(() {
                showSnackBar('Video Uploaded');
                print('Upload Video');
              }),
              SizedBox(height: 15),

              SizedBox(height: 12),
              Container(
                  height: 70.0,
                  child: InputDecorator(
                    decoration: InputDecoration(
                      labelText: 'Production House',
                      errorStyle:
                          TextStyle(color: Colors.redAccent, fontSize: 16.0),
                      hintText: 'Production House',
                    ),
                    isEmpty: _currentHouseValue == '',
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: _currentHouseValue,
                        isDense: true,
                        onChanged: (String newValue) {
                          setState(() {
                            _currentHouseValue = newValue;
                            // state.didChange(newValue);
                          });
                        },
                        items: _houses.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  )),
              SizedBox(height: 10.0),
              // A container holding a simple text field
              //
              Container(
                height: 70.0,
                child: TextFormField(
                    validator: (input) {
                      if (input.length < 6) {
                        return 'please provide a valid house name';
                      }
                    },
                    controller: productionHouseNameController,
                    onSaved: (input) {
                      productionHouseName = input;
                    },
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      labelText: 'Production House Name',
                    )),
              ),
              SizedBox(height: 10),
              //
              // A container holding a simple text field
              Container(
                height: 70.0,
                child: TextFormField(
                    validator: (input) {
                      if (input.length < 6) {
                        return 'please provide a valid email';
                      }
                    },
                    controller: productionHouseContactController,
                    onSaved: (input) {
                      productionHouseContactEmail = input;
                    },
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      labelText: 'Production House Contact E-mail',
                    )),
              ),
              SizedBox(height: 40),

              Padding(
                  padding: EdgeInsets.only(left: 60, right: 60),
                  child: ButtonTheme(
                      height: 40,
                      // A button to verify the fields of the form and prints the result
                      //in the console
                      //
                      child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          color: Colors.green,
                          onPressed: () {
                            validate(); //To validate the form
                            print('Title : $title');
                            print('Country : $selectedValue');
                            print('Language : $selectedValue2');
                            print('Type : $_currentTypeValue');
                            print('Synopsis : $synopsis');
                            print('Production House : $_currentHouseValue');
                            print('HouseName : $productionHouseName');
                            print(
                                'Contact Email : $productionHouseContactEmail');
                          },
                          child: Text(
                            'SUBMIT',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 26.0,
                              fontWeight: FontWeight.w300,
                            ),
                          )))),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

//Validator function
  Future<void> validate() async {
    final formState = _formkey.currentState;
    if (formState.validate()) {
      formState.save();
    }
  }
}
