import 'dart:ffi';
import 'dart:io';

import 'package:app/register/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:cross_file/cross_file.dart';

class SetName extends StatefulWidget {
  @override
  _SetName createState() => _SetName();
}

class _SetName extends State<SetName> {
  final TextEditingController _controller = new TextEditingController();
  String _inputName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
          child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                  child: Container(
                padding: const EdgeInsets.fromLTRB(
                  30.0,
                  70.0,
                  30.0,
                  20.0,
                ),
                child: Text(
                  "이름을 알려주세요",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              )),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                  child: Container(
                padding: const EdgeInsets.fromLTRB(
                  30.0,
                  0.0,
                  30.0,
                  80.0,
                ),
                child: Text(
                  "영어이름이 있을경우 영어이름을, 없을 경우\n한글 이름을 영문으로 써주세요.",
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.6), fontSize: 15),
                ),
              )),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                  child: Container(
                padding: const EdgeInsets.fromLTRB(
                  30.0,
                  0.0,
                  30.0,
                  80.0,
                ),
                child: TextField(
                  controller: _controller,
                  onChanged: (text) {
                    setState(() {
                      this._inputName = text;
                    });
                  },
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: '이름',
                    suffixIcon: IconButton(
                      onPressed: () {
                        _controller.clear();
                        setState(() {
                          this._inputName = '';
                        });
                      },
                      icon: Icon(Icons.clear),
                    ),
                  ),
                ),
              )),
            ],
          ),
          Expanded(
              child: Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    padding: EdgeInsets.all(15.0),
                    child: this._inputName == ''
                        ? FloatingActionButton(
                            onPressed: () {
                              /* name '' skip  */
                            },
                            child: new Icon(
                              Icons.navigate_next,
                              color: Colors.white,
                              size: 30.0,
                            ),
                            backgroundColor: Colors.blue,
                          )
                        : FloatingActionButton.extended(
                            onPressed: () {
                              Navigator.pushNamed(context,
                                  RegisterController.setJoinDateAndJob);
                            },
                            label: Row(children: <Widget>[
                              Text(this._inputName + '이 맞나요?',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15)),
                              Icon(
                                Icons.navigate_next,
                                color: Colors.white,
                                size: 30.0,
                              ),
                            ]),
                            backgroundColor: Colors.blue,
                          ),
                  ))),
        ],
      )),
    );
  }
}

class SetJoinDateAndJob extends StatefulWidget {
  @override
  _SetJoinDateAndJob createState() => _SetJoinDateAndJob();
}

class _SetJoinDateAndJob extends State<SetJoinDateAndJob> {
  final TextEditingController _pickedJoinDatecontroller =
      new TextEditingController();
  DateTime pickedJoinDate = DateTime.now();

  Map<String, List<String>> jobAreaAndJobMap = {
    'Manager': ['HR 매니저', '프로덕트 매니저', '기획 매니저', '고객 매니저'],
    'Designer': ['프로덕트 디자이너', '프로모션 디자이너', '블라블라 디저이너'],
    'Developer': ['IOS 개발자', 'AOS 개발자', '웹 프론트엔드 개발자', '서버 개발자', '백엔드 개발자'],
  };

  String _selectedJobName = '';

  Widget _buildJobAreaAndChips() {
    Map<String, List<Widget>> jobAreaAndChips = {};
    jobAreaAndJobMap.forEach((key, value) {
      jobAreaAndChips[key] = _buildChips(key, value);
    });
    return Column(
        children: jobAreaAndChips.entries
            .map((entry) => Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(15.0, 8.0, 0.0, 0.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(entry.key),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Wrap(
                            alignment: WrapAlignment.start,
                            spacing: 2.5,
                            runSpacing: 2.0,
                            children: entry.value,
                          ),
                        )),
                  ],
                ))
            .toList());
  }

  List<Widget> _buildChips(String prefix, List<String> chipNames) {
    List<Widget> chips = [];

    chipNames.forEach((name) {
      ChoiceChip choiceChip = ChoiceChip(
        label: Text(name),
        selected: _selectedJobName == prefix + name,
        onSelected: (bool selected) {
          setState(() {
            if (selected) {
              _selectedJobName = prefix + name;
            }
          });
        },
      );

      chips.add(Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.0), child: choiceChip));
    });

    return chips;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
          child: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                  child: Container(
                padding: const EdgeInsets.fromLTRB(
                  30.0,
                  30.0,
                  30.0,
                  20.0,
                ),
                child: Text(
                  "직무와 입사일을\n선택 및 입력해주세요!",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              )),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                  child: Container(
                padding: const EdgeInsets.fromLTRB(
                  30.0,
                  0.0,
                  30.0,
                  20.0,
                ),
                child: TextField(
                  controller: _pickedJoinDatecontroller,
                  showCursor: false,
                  readOnly: true,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: 'YYYY.MM.DD',
                    suffixIcon: IconButton(
                      onPressed: _pickedJoinDatecontroller.clear,
                      icon: Icon(Icons.clear),
                    ),
                  ),
                  onTap: () {
                    DatePicker.showDatePicker(context,
                        showTitleActions: true,
                        minTime: DateTime(1900, 1, 1),
                        maxTime: DateTime.now(),
                        onChanged: (date) {}, onConfirm: (date) {
                      this.pickedJoinDate = date;
                      _pickedJoinDatecontroller.text =
                          DateFormat('yyyy.MM.dd').format(pickedJoinDate);
                    }, currentTime: DateTime.now(), locale: LocaleType.ko);
                  },
                ),
              )),
            ],
          ),
          Container(
            child: _buildJobAreaAndChips(),
          ),
          Expanded(
              child: Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    padding: EdgeInsets.all(15.0),
                    child: FloatingActionButton(
                      onPressed: () {
                        Navigator.pushNamed(
                            context, RegisterController.setProfileImage);
                      },
                      child: new Icon(
                        Icons.navigate_next,
                        color: Colors.white,
                        size: 40.0,
                      ),
                      backgroundColor: Colors.blue,
                    ),
                  ))),
        ],
      )),
    );
  }
}

class SetProfileImage extends StatefulWidget {
  @override
  _SetProfileImage createState() => _SetProfileImage();
}

class _SetProfileImage extends State<SetProfileImage> {
  XFile? _imageFile = null;
  final ImagePicker _picker = ImagePicker();

  void _onImageButtonPressed() async {
    try {
      final pickedFile = await _picker.pickImage(
        source: ImageSource.gallery,
      );
      setState(() {
        _imageFile = pickedFile;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
          child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                  child: Container(
                padding: const EdgeInsets.fromLTRB(
                  30.0,
                  70.0,
                  30.0,
                  20.0,
                ),
                child: Text(
                  "프로필 사진을\n등록해주세요!",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              )),
            ],
          ),
          GestureDetector(
            child: _imageFile == null
                ? CircleAvatar(
                    radius: 80.0,
                    backgroundImage:
                        NetworkImage('https://via.placeholder.com/150'),
                    backgroundColor: Colors.transparent,
                  )
                : CircleAvatar(
                    radius: 80.0,
                    foregroundImage: Image.file(
                      File(_imageFile!.path),
                      width: 100,
                      height: 100,
                    ).image,
                  ),
            onTap: () {
              _onImageButtonPressed();
            },
          ),
          Expanded(
              child: Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    padding: EdgeInsets.all(15.0),
                    child: FloatingActionButton(
                      onPressed: () {
                        Navigator.pushNamed(
                            context, RegisterController.setHobbyAndFavourite);
                      },
                      child: new Icon(
                        Icons.navigate_next,
                        color: Colors.white,
                        size: 40.0,
                      ),
                      backgroundColor: Colors.blue,
                    ),
                  ))),
        ],
      )),
    );
  }
}

class SetHobbyAndFavourite extends StatefulWidget {
  @override
  _SetHobbyAndFavourite createState() => _SetHobbyAndFavourite();
}

class _SetHobbyAndFavourite extends State<SetHobbyAndFavourite> {
  Map<String, List<String>> hobbyAndFavorite = {
    '취미를 알려주세요.': [
      '🐴그림그 리기',
      '🦞프로덕트 매니저',
      '기획 매니저',
      '고객 매니저',
      '🐴그림그 리기',
      '🦞프로덕트 매니저',
      '기획 매니저',
      '고객 매니저',
      '🐴그림그 리기',
      '🦞프로덕트 매니저',
      '기획 매니저',
      '고객 매니저',
      '🐴그림그 리기',
      '🦞프로덕트 매니저',
      '기획 매니저',
      '고객 매니저',
    ],
    '좋아하는것을 알려주세요.': [
      '👨‍🌾 노래',
      '🧑‍🔧식물',
      '헬스',
      '볼링하기',
      '잠만보',
      '사진 찰영하기',
      '여행떠나기',
      '👨‍🌾 노래',
      '🧑‍🔧식물',
      '헬스',
      '볼링하기',
      '잠만보',
      '사진 찰영하기',
      '여행떠나기',
      '👨‍🌾 노래',
      '🧑‍🔧식물',
      '헬스',
      '볼링하기',
      '잠만보',
      '사진 찰영하기',
      '여행떠나기',
      '👨‍🌾 노래',
      '🧑‍🔧식물',
      '헬스',
      '볼링하기',
      '잠만보',
      '사진 찰영하기',
      '여행떠나기',
    ],
  };

  Set<String> _selectedInterest = {};

  Widget _buildHobbyAndFavorite() {
    Map<String, List<List<Widget>>> interestAndChips = {};

    hobbyAndFavorite.forEach((key, value) {
      var len = value.length;
      var size = 7;
      var chunks = [];
      for (var i = 0; i < len; i += size) {
        var end = (i + size < len) ? i + size : len;
        chunks.add(value.sublist(i, end));
      }
      List<List<Widget>> chips = [];
      for (var i = 0; i < chunks.length; i++) {
        chips.add(_buildChips(key, chunks[i]));
      }
      interestAndChips[key] = chips;
    });
    return Column(
        children: interestAndChips.entries
            .map((entry) => Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(15.0, 8.0, 0.0, 0.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(entry.key),
                      ),
                    ),
                    Column(
                      children: entry.value
                          .map(
                            (e) => new Padding(
                                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Wrap(
                                        alignment: WrapAlignment.start,
                                        spacing: 2.5,
                                        runSpacing: 2.0,
                                        children: e,
                                      )),
                                )),
                          )
                          .toList(),
                    ),
                  ],
                ))
            .toList());
  }

  List<Widget> _buildChips(String prefix, List<String> chipNames) {
    List<Widget> chips = [];

    chipNames.forEach((name) {
      ChoiceChip choiceChip = ChoiceChip(
        label: Text(name),
        selected: _selectedInterest.contains(prefix + name),
        onSelected: (bool selected) {
          setState(() {
            if (selected) {
              _selectedInterest.add(prefix + name);
            } else {
              _selectedInterest.remove(prefix + name);
            }
          });
        },
      );

      chips.add(Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.0), child: choiceChip));
    });

    return chips;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
          child: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                  child: Container(
                padding: const EdgeInsets.fromLTRB(
                  30.0,
                  30.0,
                  20.0,
                  20.0,
                ),
                child: Text(
                  "알리고 싶은 관심사를\n선택해주세요!",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              )),
            ],
          ),
          Container(
            child: _buildHobbyAndFavorite(),
          ),
          Expanded(
              child: Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    padding: EdgeInsets.all(15.0),
                    child: FloatingActionButton(
                      onPressed: () {
                        /* skip : todo check email certification
                           goto : register
                        */
                      },
                      child: new Icon(
                        Icons.navigate_next,
                        color: Colors.white,
                        size: 40.0,
                      ),
                      backgroundColor: Colors.blue,
                    ),
                  ))),
        ],
      )),
    );
  }
}
