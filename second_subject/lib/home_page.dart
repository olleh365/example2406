import 'package:flutter/material.dart';
import './floating_btn.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.fromLTRB(24, 44, 24, 16),
        children: [
          Container(
            height: 50,
            decoration: BoxDecoration(
              border:Border.all(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Row( // Row 위젯을 사용하여 아이템을 수평으로 배열
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/profile.jpg'), // 프로필 이미지 파일
                  ),
                ),
                Text(
                  '허준우',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ],
            ),
          ),
        SizedBox(height: 20),
        Container(
            height: 400,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: Text(
                '이미지 예시입니다.',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingButton(),
    );
  }
}

