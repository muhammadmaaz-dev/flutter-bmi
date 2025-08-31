import 'package:bmi/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Userinput extends StatefulWidget {
  const Userinput({super.key});

  @override
  State<Userinput> createState() => _UserinputState();
}

class _UserinputState extends State<Userinput> {
  final nameController = TextEditingController();
  final ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final sizeh = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),

                /// 👩 Image
                SizedBox(
                  height: 250.h,
                  width: double.infinity,
                  child: Image.asset(
                    'assets/images/girl.png',
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[200],
                        child: Icon(
                          Icons.person,
                          size: 100.sp,
                          color: Colors.grey[400],
                        ),
                      );
                    },
                  ),
                ),

                SizedBox(height: 30.h),

                /// Question
                Text(
                  "What is Your Name?",
                  style: TextStyle(
                    fontSize: 25.sp,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Nunito',
                    color: Colors.black,
                  ),
                ),

                SizedBox(height: 30.h),

                /// Name Row
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Name",
                      style: TextStyle(
                        fontSize: 25.sp,

                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 9.w),
                    Expanded(
                      child: SizedBox(
                        height: 50.h,
                        child: TextField(
                          controller: nameController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color(0xFFB2EBF2),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.r),
                              ),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 12.w,
                              vertical: 8.h,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 230.h),

                /// Simple Button
                Center(
                  child: SizedBox(
                    width: 240.w,
                    height: 70.h,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0XFF39CDFA),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.r),
                        ),
                      ),
                      onPressed: () {
                        if (nameController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                "Please enter your name",
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontFamily: 'Nunito',
                                ),
                              ),
                              backgroundColor: Colors.red,
                              duration: const Duration(seconds: 2),
                            ),
                          );
                          return; // Stop further execution if name is empty
                        }
                        // Simple navigation - no conditions
                        Navigator.of(context).pushReplacement(
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    Home(namefromuser: nameController.text),
                            transitionsBuilder:
                                (
                                  context,
                                  animation,
                                  secondaryAnimation,
                                  child,
                                ) {
                                  const begin = Offset(1.0, 0.0);
                                  const end = Offset.zero;

                                  var tween = Tween(begin: begin, end: end)
                                      .chain(
                                        CurveTween(
                                          curve: Curves.easeInOut,
                                        ), // smooth curve
                                      );

                                  return SlideTransition(
                                    position: animation.drive(tween),
                                    child: child,
                                  );
                                },
                          ),
                        );
                      },

                      child: Text(
                        "Done",
                        style: TextStyle(
                          fontFamily: 'Boldonse',
                          fontSize: 25.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 30.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
