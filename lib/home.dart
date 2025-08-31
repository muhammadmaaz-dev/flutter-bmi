import 'package:bmi/info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home extends StatefulWidget {
  final String namefromuser;
  const Home({super.key, required this.namefromuser});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ageController = TextEditingController();
  final weightController = TextEditingController();
  final heightController = TextEditingController();

  String selectgender = 'Male';

  @override
  Widget build(BuildContext context) {
    final sizew = MediaQuery.of(context).size.width; // ✅ screen size
    final sizeh = MediaQuery.of(context).size.height; // ✅ screen size
    return Scaffold(
      backgroundColor: Color(0XFF99E7ff),
      body: SafeArea(
        child: Container(
          color: const Color(0XFF99E7ff),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              // 🔹 Top Menu Row
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 30.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.menu, size: 35.sp),
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
                    "Hi, ${widget.namefromuser}",
                    style: TextStyle(fontSize: 35.sp, fontFamily: 'Serif'),
                  ),
                ),
              ),

              SizedBox(height: 8.h),

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
                        SizedBox(height: 10.h),

                        // 🔹 Avatars Row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 60.r,
                              backgroundImage: AssetImage(
                                'assets/images/menAV.jpg',
                              ),
                            ),
                            SizedBox(width: 15.w),
                            CircleAvatar(
                              radius: 60.r,
                              backgroundImage: AssetImage(
                                'assets/images/girlAV.jpg',
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 20.h),
                        // 🔹 Gender Selection Row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectgender = 'Male';
                                });
                              },
                              child: Container(
                                height: 45.h,
                                width: 150.w,
                                decoration: BoxDecoration(
                                  color: selectgender == 'Male'
                                      ? Color(0XFF39cdfa)
                                      : Colors.lightBlue[100],
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    bottomLeft: Radius.circular(15),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    'Male',
                                    style: TextStyle(
                                      fontSize: 27.sp,
                                      color: selectgender == 'Male'
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectgender = 'Female';
                                });
                              },
                              child: Container(
                                height: 45.h,
                                width: 150.w,
                                decoration: BoxDecoration(
                                  color: selectgender == 'Female'
                                      ? Color(0XFF39cdfa)
                                      : Colors.lightBlue[100],
                                  borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(15),
                                    bottomRight: Radius.circular(15),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    'Female',
                                    style: TextStyle(
                                      fontSize: 27.sp,
                                      color: selectgender == 'Female'
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 40.h),

                        // 🔹 Age Input Row
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 25.w),
                          child: Row(
                            children: [
                              Text(
                                "Age",
                                style: TextStyle(
                                  fontSize: 25.sp,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Boldones',
                                ),
                              ),
                              SizedBox(width: 10.w),
                              Expanded(
                                child: TextField(
                                  controller: ageController,
                                  keyboardType: TextInputType.numberWithOptions(
                                    decimal: true,
                                    signed: false,
                                  ),
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: const Color(0xFFB2EBF2),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.r),
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 30.h),

                        // 🔹 Weight Input
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 25.w),
                          child: Row(
                            children: [
                              Text(
                                "Weight",
                                style: TextStyle(
                                  fontSize: 25.sp,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Boldones',
                                ),
                              ),
                              SizedBox(width: 10.w),
                              Expanded(
                                child: TextField(
                                  controller: weightController,
                                  keyboardType: TextInputType.numberWithOptions(
                                    decimal: true,
                                    signed: false,
                                  ),
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: const Color(0xFFB2EBF2),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.r),
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 8.w),
                              Container(
                                height: 49.h,
                                width: 60.w,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFB2EBF2),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Text(
                                    'Kg',
                                    style: TextStyle(
                                      fontSize: 25.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 30.h),

                        // 🔹 Height Input
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 25.w),
                          child: Row(
                            children: [
                              Text(
                                "Height",
                                style: TextStyle(
                                  fontSize: 25.sp,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Boldones',
                                ),
                              ),
                              SizedBox(width: 10.w),
                              Expanded(
                                child: TextField(
                                  controller: heightController,
                                  keyboardType: TextInputType.numberWithOptions(
                                    decimal: true,
                                    signed: false,
                                  ),

                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: const Color(0xFFB2EBF2),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.r),
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 8.w),
                              Container(
                                height: 49.h, //
                                width: 60.w,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFB2EBF2),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Text(
                                    'Cm',
                                    style: TextStyle(
                                      fontSize: 25.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 60.h),

                        // 🔹 Calculate Button
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.7,
                          height: MediaQuery.of(context).size.width * 0.17,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(
                                Color(0XFF39CDFA),
                              ),
                              foregroundColor: WidgetStatePropertyAll(
                                Colors.white,
                              ),
                            ),
                            onPressed: () {
                              if (ageController.text.isEmpty ||
                                  weightController.text.isEmpty ||
                                  heightController.text.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      "Kindly Fill the Above Form ⚠",
                                    ),
                                    backgroundColor: Colors.redAccent,
                                  ),
                                );
                                return;
                              }

                              double? age =
                                  double.tryParse(ageController.text) ?? 0;
                              double? weight =
                                  double.tryParse(weightController.text) ?? 0;
                              double? heightCm =
                                  double.tryParse(heightController.text) ?? 0;

                              double height = heightCm / 100;

                              if (age == 0 || age <= 0 || age > 120) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      "⚠ Enter a valid Age (1-120)",
                                    ),
                                    duration: Duration(seconds: 2),
                                  ),
                                );
                                return;
                              }

                              if (weight == 0 || weight <= 0 || weight > 500) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      "⚠ Enter a valid Weight (1-500 Kg)",
                                    ),
                                    duration: Duration(seconds: 2),
                                  ),
                                );
                                return;
                              }

                              if (height == 0 || height <= 0 || height > 3) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      "⚠ Enter a valid Height in meters (0.3 - 3)",
                                    ),
                                    duration: Duration(seconds: 2),
                                  ),
                                );
                                return;
                              }

                              double bmi = weight / (height * height);

                              Navigator.of(context).push(
                                PageRouteBuilder(
                                  transitionDuration: const Duration(
                                    milliseconds: 700,
                                  ), // thoda slow for smoothness
                                  pageBuilder:
                                      (
                                        context,
                                        animation,
                                        secondaryAnimation,
                                      ) => Info(
                                        bmi: bmi,
                                        age: age,
                                        heightformuser: heightCm,
                                        weightfromuser: weight,
                                      ),
                                  transitionsBuilder:
                                      (
                                        context,
                                        animation,
                                        secondaryAnimation,
                                        child,
                                      ) {
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
                              "Calculate",
                              style: TextStyle(
                                fontSize: 25,
                                fontFamily: 'Boldonse',
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: 10.h),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
