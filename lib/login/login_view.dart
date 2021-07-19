import 'package:flutter/material.dart';
import 'package:app/login/login_controller.dart';

class SelectRegisterOrLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  100.0,
                ),
                child: Text(
                  "직장인들을 위한\n네트워킹 플랫폼, atwork!",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              )),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: ElevatedButton(
                  onPressed: () => Navigator.pushReplacementNamed(
                      context, LoginController.registerOrLogin),
                  child: Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Text("이미 계정이 있어요"),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                    ),
                  ),
                ),
              ))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ElevatedButton(
                        onPressed: () => Navigator.pushReplacementNamed(
                            context, LoginController.registerOrLogin),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text("계정 만들기"),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                          ),
                        ),
                      ))),
            ],
          ),
        ],
      )),
    );
  }
}

class RegisterOrLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  "직장인들을 위한\n네트워킹 플랫폼, atwork!",
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
                  "회사에서 사용하는 이메일을 적어주세요!",
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
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(), hintText: '이메일'),
                ),
              )),
            ],
          ),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            Container(
              padding: const EdgeInsets.only(top: 300),
              child: MaterialButton(
                padding: EdgeInsets.all(3),
                onPressed: () => {},
                child: new Icon(
                  Icons.navigate_next,
                  color: Colors.white,
                  size: 45.0,
                ),
                shape: new CircleBorder(),
                color: Colors.blue,
              ),
            )
          ]),
        ],
      )),
    );
  }
}
