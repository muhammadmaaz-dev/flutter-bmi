import 'package:bmi/userinput.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Mainscreen extends StatelessWidget {
  const Mainscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final sizew = MediaQuery.of(context).size.width; // ✅ screen size
    final sizeh = MediaQuery.of(context).size.height; // ✅ screen size
    return Scaffold(
      backgroundColor: Color(0XFF99E7ff),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(color: Color(0XFF99e7ff)),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              SizedBox(height: 125.h),
              AutoSizeText(
                "BMI",
                style: TextStyle(fontFamily: 'Boldonse', fontSize: 130.sp),
                maxLines: 1,
                minFontSize: 20,
              ),
              AutoSizeText(
                "Calculator",
                style: TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 60.sp,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                minFontSize: 18,
              ),
              Padding(
                padding: EdgeInsets.only(left: 4.w, right: 4.w, bottom: 2.h),
                child: AutoSizeText(
                  "Welcome to BMI Calculator, Your Personal",
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  minFontSize: 12,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 4.w, right: 4.w, bottom: 2.h),
                child: AutoSizeText(
                  "Tool for Tracking Your Body Mass Index (BMI)",
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  minFontSize: 12,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 4.w, right: 4.w, bottom: 2.h),
                child: AutoSizeText(
                  "and Monitoring Your Health",
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  minFontSize: 12,
                ),
              ),
              Spacer(),
              SizedBox(
                width: 250.w,
                height: 70.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0XFF39CDFA),
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      PageRouteBuilder(
                        transitionDuration: const Duration(
                          milliseconds: 700,
                        ), // thoda slow for smoothness
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            Userinput(),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                              const begin = Offset(1.0, 0.0);
                              const end = Offset.zero;

                              // 👇 advanced smooth curve
                              var curve = Curves.easeInOutCubic;

                              var tween = Tween(
                                begin: begin,
                                end: end,
                              ).chain(CurveTween(curve: curve));

                              return SlideTransition(
                                position: animation.drive(tween),
                                child: child,
                              );
                            },
                      ),
                    );
                  },
                  child: Text(
                    "Start",
                    style: TextStyle(fontSize: 25.sp, fontFamily: 'Boldonse'),
                  ),
                ),
              ),
              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }
}
