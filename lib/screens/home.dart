import 'package:contracts_simplified/theme/colors.dart';
import 'package:contracts_simplified/theme/devicesize.dart';
import 'package:contracts_simplified/theme/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool app_openedBefore = false;

@override
  void initState(){
    super.initState();
    checkIfOpenedBefore();
  }

  Future<void> checkIfOpenedBefore() async {
    final prefs = await SharedPreferences.getInstance();
    final openedBefore = prefs.getBool('openedBefore') ?? false;

    if(!openedBefore){
      await prefs.setBool('openedBefore', true);
    }

    setState(() {
      app_openedBefore = openedBefore;
    });
 
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorStyles.background,
      body: Center(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(color: AppColorStyles.primary),
              height: context.deviceHeight(0.3),
              padding: EdgeInsets.fromLTRB(10, 100, 10, 10),
              child: Row(
                children: [
                  Column(
                    children: [
                      Text('Hey There!', style: AppTextStyles.h1),
                      SizedBox(height: 10),
                      Text(
                        'Welcome to Contracts Simplified',
                        style: AppTextStyles.body,
                      ),
                    ],
                  ),
                  Image(image: AssetImage('assets/images/avatar_main.png')),
                ],
              ),
            ),
            SizedBox(height: 10),
            app_openedBefore ? _buildHorizontalBoxes() : _buildVerticalBoxes() 
          ],
        ),
      ),
    );
  }
  
  Widget _buildHorizontalBoxes(){
    return Container(
      child:  Row(
              children: [
                // 📷 Scan Card
                Expanded(
                  child: InkWell(
                    onTap: () {
                      print('Scan tapped');
                    },
                    child: Container(
                      height: 120,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColorStyles.primary,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.camera_alt, color: Colors.white, size: 28),
                          SizedBox(height: 10),
                          Text(
                            'Scan New Document',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            'Use camera to scan instantly',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      print('Upload tapped');
                    },
                    child: Container(
                      height: 120,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColorStyles.secondary,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.upload_file,
                            color: Colors.white,
                            size: 28,
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Upload From Device',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            'Pick files from storage',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  Widget _buildVerticalBoxes(){
    return Container(
      child: Column(
        children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      print('Scan tapped');
                    },
                    child: Container(
                      height: 120,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColorStyles.primary,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.camera_alt, color: Colors.white, size: 28),
                          SizedBox(height: 10),
                          Text(
                            'Scan New Document',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            'Use camera to scan instantly',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      print('Upload tapped');
                    },
                    child: Container(
                      height: 120,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColorStyles.secondary,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.upload_file,
                            color: Colors.white,
                            size: 28,
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Upload From Device',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            'Pick files from storage',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }

}
