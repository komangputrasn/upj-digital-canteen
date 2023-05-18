import 'package:flutter/material.dart';
import 'utils.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      debugShowCheckedModeBanner: false,
      scrollBehavior: MyCustomScrollBehavior(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: SingleChildScrollView(
          child: Scene(),
        ),
      ),
    );
  }
}

class Scene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: double.infinity,
      child: Container(
        // notifikasieSz (312:629)
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xfff8f8f8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // autogroupfnv4q1g (SjyuVeTZcu95TQmdPAfNV4)
              margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 8 * fem),
              padding:
                  EdgeInsets.fromLTRB(33 * fem, 51 * fem, 35 * fem, 21 * fem),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xffffffff),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    // vectorvYv (312:685)
                    margin: EdgeInsets.fromLTRB(
                        2 * fem, 0 * fem, 0 * fem, 25.05 * fem),
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                      ),
                      child: Container(
                        width: 10.85 * fem,
                        height: 18.95 * fem,
                        child: Image.asset(
                          'assets/pembeli/images/vector-93k.png',
                          width: 10.85 * fem,
                          height: 18.95 * fem,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    // optionbarQDC (312:680)
                    width: double.infinity,
                    height: 33 * fem,
                    decoration: BoxDecoration(
                      color: Color(0xffcd042e),
                      borderRadius: BorderRadius.circular(15 * fem),
                    ),
                    child: Center(
                      child: Text(
                        'Notifikasi',
                        style: SafeGoogleFont(
                          'Poppins',
                          fontSize: 13 * ffem,
                          fontWeight: FontWeight.w600,
                          height: 1.5 * ffem / fem,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // autogroupffyxHXt (SjyuethA7qRrKEhLrZffyx)
              padding:
                  EdgeInsets.fromLTRB(23 * fem, 34 * fem, 23 * fem, 316 * fem),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xffffffff),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // cardnotificationsDAe (312:692)
                    padding: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 135 * fem, 0 * fem),
                    width: double.infinity,
                    height: 81 * fem,
                    decoration: BoxDecoration(
                      color: Color(0xffffffff),
                      borderRadius: BorderRadius.circular(9 * fem),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x26000000),
                          offset: Offset(0 * fem, 4 * fem),
                          blurRadius: 3.5 * fem,
                        ),
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // rectangle45yY (312:694)
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 11 * fem, 0 * fem),
                          width: 19 * fem,
                          height: 81 * fem,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.5 * fem),
                            color: Color(0xffcd042e),
                          ),
                        ),
                        Container(
                          // autogroupx4ucQkv (SjyvJxS4oYapTugwkDx4uc)
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 16 * fem, 0 * fem, 18 * fem),
                          height: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                // informationnamejYJ (312:696)
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0 * fem, 0 * fem, 2 * fem),
                                child: Text(
                                  'Information name',
                                  style: SafeGoogleFont(
                                    'Poppins',
                                    fontSize: 16 * ffem,
                                    fontWeight: FontWeight.w600,
                                    height: 1.5 * ffem / fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ),
                              Text(
                                // tanggalSxW (312:695)
                                'Tanggal',
                                style: SafeGoogleFont(
                                  'Poppins',
                                  fontSize: 14 * ffem,
                                  fontWeight: FontWeight.w400,
                                  height: 1.5 * ffem / fem,
                                  color: Color(0xff000000),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25 * fem,
                  ),
                  Container(
                    // cardnotificationsySe (312:697)
                    padding: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 135 * fem, 0 * fem),
                    width: double.infinity,
                    height: 81 * fem,
                    decoration: BoxDecoration(
                      color: Color(0xffffffff),
                      borderRadius: BorderRadius.circular(9 * fem),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x26000000),
                          offset: Offset(0 * fem, 4 * fem),
                          blurRadius: 3.5 * fem,
                        ),
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // rectangle4Tsc (312:699)
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 11 * fem, 0 * fem),
                          width: 19 * fem,
                          height: 81 * fem,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.5 * fem),
                            color: Color(0xffcd042e),
                          ),
                        ),
                        Container(
                          // autogroupqq4nbiv (Sjyv6iHU669UFDjV3EqQ4N)
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 16 * fem, 0 * fem, 18 * fem),
                          height: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                // informationname8Tx (312:701)
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0 * fem, 0 * fem, 2 * fem),
                                child: Text(
                                  'Information name',
                                  style: SafeGoogleFont(
                                    'Poppins',
                                    fontSize: 16 * ffem,
                                    fontWeight: FontWeight.w600,
                                    height: 1.5 * ffem / fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ),
                              Text(
                                // tanggalrPx (312:700)
                                'Tanggal',
                                style: SafeGoogleFont(
                                  'Poppins',
                                  fontSize: 14 * ffem,
                                  fontWeight: FontWeight.w400,
                                  height: 1.5 * ffem / fem,
                                  color: Color(0xff000000),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25 * fem,
                  ),
                  Container(
                    // cardnotificationsPPt (312:686)
                    padding: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 135 * fem, 0 * fem),
                    width: double.infinity,
                    height: 81 * fem,
                    decoration: BoxDecoration(
                      color: Color(0xffffffff),
                      borderRadius: BorderRadius.circular(9 * fem),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x26000000),
                          offset: Offset(0 * fem, 4 * fem),
                          blurRadius: 3.5 * fem,
                        ),
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // rectangle4gtn (312:691)
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 11 * fem, 0 * fem),
                          width: 19 * fem,
                          height: 81 * fem,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.5 * fem),
                            color: Color(0xffcd042e),
                          ),
                        ),
                        Container(
                          // autogroupkkvcDti (SjyurPN1HAL4CD9NFekkVc)
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 16 * fem, 0 * fem, 18 * fem),
                          height: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                // informationnameAZ4 (312:690)
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0 * fem, 0 * fem, 2 * fem),
                                child: Text(
                                  'Information name',
                                  style: SafeGoogleFont(
                                    'Poppins',
                                    fontSize: 16 * ffem,
                                    fontWeight: FontWeight.w600,
                                    height: 1.5 * ffem / fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ),
                              Text(
                                // tanggalVbL (312:689)
                                'Tanggal',
                                style: SafeGoogleFont(
                                  'Poppins',
                                  fontSize: 14 * ffem,
                                  fontWeight: FontWeight.w400,
                                  height: 1.5 * ffem / fem,
                                  color: Color(0xff000000),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
