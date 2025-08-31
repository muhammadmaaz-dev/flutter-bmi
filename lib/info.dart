import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Info extends StatelessWidget {
  const Info({
    super.key,
    required this.bmi,
    required this.age,

    required this.heightformuser,
    required this.weightfromuser,
  });

  final double bmi;
  final double age;

  final double heightformuser;
  final double weightfromuser;

  @override
  Widget build(BuildContext context) {
    final sizew = MediaQuery.of(context).size.width; // ✅ screen size
    final sizeh = MediaQuery.of(context).size.height; // ✅ screen size
    double percent = (bmi / 50).clamp(0.0, 1.0);
    return Scaffold(
      body: Container(
        color: const Color(0XFF99E7ff),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            // 🔹 Top Menu Row
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 50.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back, size: 35.sp),
                  ),
                  Icon(Icons.notifications, size: 35.sp),
                ],
              ),
            ),

            // 🔹 Greeting Text
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Your BMI Result",
                  style: TextStyle(fontSize: 30.sp, fontFamily: 'Serif'),
                ),
              ),
            ),

            SizedBox(height: 10.h),

            // 🔹 White Card Container
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50.r),
                    topRight: Radius.circular(50.r),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 15.h),
                      CircularPercentIndicator(
                        radius: 90.r,
                        lineWidth: 12.w,
                        animation: true,
                        percent: percent,
                        circularStrokeCap: CircularStrokeCap.round,
                        progressColor: Color(0XFF39CDFA),
                        backgroundColor: const Color.fromARGB(
                          255,
                          220,
                          220,
                          220,
                        ),
                        center: Text(
                          bmi.toStringAsFixed(1),
                          style: TextStyle(
                            fontFamily: 'Boldonse',
                            fontSize: 30.sp,
                          ),
                        ),
                      ),

                      SizedBox(height: 10.h),
                      Text(
                        getBMICategory(bmi),
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 25.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 15.h),

                      Container(
                        width: 300.w,
                        height: 85.h,
                        decoration: BoxDecoration(
                          color: Color(0XFF99E7ff),
                          borderRadius: BorderRadius.circular(26.r),
                        ),

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                          children: [
                            Column(
                              children: [
                                SizedBox(height: 10.h),
                                Text(
                                  "Age",
                                  style: TextStyle(
                                    fontFamily: 'Serif',
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                SizedBox(height: 10.h),
                                Text(
                                  age.toStringAsFixed(1),
                                  style: TextStyle(
                                    fontFamily: 'Nunito',
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              height: 70,
                              width: 1,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 105, 105, 105),
                              ),
                            ),

                            Column(
                              children: [
                                SizedBox(height: 10.h),
                                Text(
                                  "Weight",
                                  style: TextStyle(
                                    fontFamily: 'Serif',
                                    fontSize: 20.sp,
                                  ),
                                ),
                                SizedBox(height: 10.h),
                                Text(
                                  weightfromuser.toStringAsFixed(1),
                                  style: TextStyle(
                                    fontFamily: 'Nunito',
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              height: 70,
                              width: 1,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 105, 105, 105),
                              ),
                            ),
                            Column(
                              children: [
                                SizedBox(height: 10.h),
                                Text(
                                  "Height",
                                  style: TextStyle(
                                    fontFamily: 'Serif',
                                    fontSize: 20.sp,
                                  ),
                                ),
                                SizedBox(height: 10.h),
                                Text(
                                  heightformuser.toStringAsFixed(0),
                                  style: TextStyle(
                                    fontFamily: 'Nunito',
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10.h),
                      ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Color(0xff02a2fe),
                          radius: 12.r,
                        ),

                        title: Text(
                          "Very Severly UnderWeight",
                          style: TextStyle(
                            fontFamily: 'Nunito',
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        trailing: Text(
                          "< 16",
                          style: TextStyle(
                            fontFamily: 'Nunito',
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Color(0xff43d2ff),
                          radius: 12.r,
                        ),

                        title: Text(
                          "Severly Underweight",
                          style: TextStyle(
                            fontFamily: 'Nunito',
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        trailing: Text(
                          "16.0 - 16.9",
                          style: TextStyle(
                            fontFamily: 'Nunito',
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Color(0xff84e5fb),
                          radius: 12.r,
                        ),

                        title: Text(
                          "UnderWeight",
                          style: TextStyle(
                            fontFamily: 'Nunito',
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        trailing: Text(
                          "17.0 - 18.4",
                          style: TextStyle(
                            fontFamily: 'Nunito',
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Color(0xff49c985),
                          radius: 12.r,
                        ),

                        title: Text(
                          "Normal",
                          style: TextStyle(
                            fontFamily: 'Nunito',
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        trailing: Text(
                          "18.5 - 24.9",
                          style: TextStyle(
                            fontFamily: 'Nunito',
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Color.fromARGB(255, 242, 27, 27),
                          radius: 12.r,
                        ),

                        title: Text(
                          "Overweight",
                          style: TextStyle(
                            fontFamily: 'Nunito',
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        trailing: Text(
                          "25.0 - 29.0",
                          style: TextStyle(
                            fontFamily: 'Nunito',
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      Container(
                        width: 400.w,
                        height: 1.h,
                        decoration: BoxDecoration(color: Colors.black),
                      ),

                      ListTile(
                        title: Text(
                          "Normal Weight",
                          style: TextStyle(
                            fontFamily: 'Nunito',
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        trailing: Text(
                          "48.4 - 62.8 Kg",
                          style: TextStyle(
                            fontFamily: 'Nunito',
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      SizedBox(height: 10.h),

                      SizedBox(height: 20.h),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String getBMICategory(double bmi) {
    if (bmi < 16) {
      return "Very Severely Underweight!";
    } else if (bmi >= 16 && bmi <= 16.9) {
      return "Severely Underweight";
    } else if (bmi >= 17 && bmi <= 18.4) {
      return "Underweight!";
    } else if (bmi >= 18.5 && bmi <= 24.9) {
      return "Normal";
    } else if (bmi >= 25 && bmi <= 29.9) {
      return "Overweight";
    } else if (bmi >= 30 && bmi <= 34.9) {
      return "Obese Class I";
    } else if (bmi >= 35 && bmi <= 39.9) {
      return "Obese Class II";
    } else {
      return "Obese Class III (Very Severe)";
    }
  }
}
