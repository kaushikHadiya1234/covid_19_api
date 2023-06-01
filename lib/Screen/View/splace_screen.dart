import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SplaceScreen extends StatefulWidget {
  const SplaceScreen({Key? key}) : super(key: key);

  @override
  State<SplaceScreen> createState() => _SplaceScreenState();
}

class _SplaceScreenState extends State<SplaceScreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3),() => Navigator.pushReplacementNamed(context, 'home'),);
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/sp.png',height: 60.w,width: 80.w,),
              SizedBox(height: 10),
              Text("Covid-19",style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.bold,color: Colors.red[900]),),
            ],
          ),
        ),
      ),
    );
  }
}
