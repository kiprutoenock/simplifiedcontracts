import 'package:contracts_simplified/screens/routes/routes.dart';
import 'package:contracts_simplified/theme/colors.dart';
import 'package:contracts_simplified/theme/devicesize.dart';
import 'package:contracts_simplified/theme/textstyles.dart';
import 'package:flutter/material.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

@override
State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>{
 
  @override
  void initState(){
    super.initState();

    Future.delayed(const Duration(milliseconds: 2000), (){
      Navigator.pushReplacementNamed(context, AppRoutes.home);
      });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(color: AppColorStyles.primary),
          width: context.deviceHeight(),
          height: context.deviceHeight(),
          child: Column(
            children: [
              Image(image: AssetImage('assets/images/splashlogo.png')),
              SizedBox(height: 20),
              Text(
                'Contracts Simplified',
                style: AppTextStyles.h1.copyWith(
                  color: AppColorStyles.textSecondary
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}


