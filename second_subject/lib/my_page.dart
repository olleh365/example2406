import 'package:flutter/material.dart';


class MyPage extends StatefulWidget {
  @override
  _MyPage createState() => _MyPage();
}

class _MyPage extends State<MyPage>{
  String selectedTab = '태그';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('T-LOG'),
        backgroundColor: Colors.white,
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(24,0,24,16),
        children: [
          Container(
            height: 32,
            child: Center(
              child: Text(
                '개인화 영역입니다.',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            child: Text(
              '허준우',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 16),
          Container(
            height: 50,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text('배너입니다.',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ),
          SizedBox(height: 16),
          Container(
            child: Text(
              '내 지도',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 16),
          Container(
            height: 200,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text('지도입니다.',
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),
            ),
            )
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(3,0,0,0),
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    setState(() {
                      selectedTab = '태그';
                    });
                  },
                  child: Text(
                    '태그',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: selectedTab == '태그' ? Colors.black : Colors.grey,
                    ),
                  ),
                ) ,
              ),
              Text(' ∙ ', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.grey)),
              Padding(
                padding: EdgeInsets.fromLTRB(0,16,0,16),
                  child : GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      setState(() {
                        selectedTab = '감정';
                      });
                    },
                    child: Text(
                      '감정',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: selectedTab == '감정' ? Colors.black : Colors.grey,
                      ),
                    ),
                  )
              )
            ],
          ),
          Container(
            height: 150,
            decoration: BoxDecoration(
              color: selectedTab == '태그' ? Colors.grey : Colors.green,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                selectedTab == '태그' ? '태그입니다.' : '감정입니다.',
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
