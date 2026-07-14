import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:contracts_simplified/screens/routes/routes.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen>
    with SingleTickerProviderStateMixin {
  final PageController _pageController = PageController();
  static const int _numPages = 4;
  late AnimationController _animationController;

  final List<String> _images = [
    'assets/images/image1.png',
    'assets/images/image2.png',
    'assets/images/image3.png',
    'assets/images/image4.png',
  ];

  final List<String> _titles = [
    'Welcome to WALOP',
    'Access 10,000+ Wallpapers for FREE',
    'Upgrade to PRO for Extra Benefits',
    'Create, Upload & Sell With Us',
  ];

  final List<String> _descriptions = [
    'Discover stunning high-quality wallpapers to personalize your device. Browse a wide variety of categories and find the perfect wallpaper that matches your mood or style every day.',
    'Access over 10,000+ wallpapers for free and download them instantly. From minimalistic designs to vibrant images, WALOP has something for everyone, without any subscription required.',
    'Upgrade to WALOP PRO and unlock exclusive wallpapers, advanced search features, and premium content. Enjoy an ad-free experience and access the latest collections before anyone else.',
    'Join our creative community: create, upload, and sell your own wallpapers. Share your designs with users worldwide, gain followers, and monetize your art effortlessly with WALOP.',
  ];

  // Helper variable to track the discrete page index for the button icon change
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();

    // 1. FIX: Initialize and assign the AnimationController
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500), // Slower for smooth effect
    );

    // 2. Set initial progress value (1/4 for the first page)
    _animationController.value = 1 / _numPages;

    // 3. Attach the listener to PageController
    _pageController.addListener(_handlePageChange);
  }

  // FIX: Define the nextPage logic here as a proper method
  void _nextPage() {
    if (_currentPageIndex < _numPages - 1) {
      // Animate to the next page
      _pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    } else {
      // Navigate to home on the last page
      // Assuming AppRoutes.home is a valid route
      Navigator.pushReplacementNamed(
        context,
        AppRoutes.home,
      ); // Use a generic name for example
    }
  }

  // Logic to smoothly update the progress bar while scrolling or after manual page change
  void _handlePageChange() {
    // The .page property is the continuous scroll position (e.g., 0.5, 1.2)
    final double currentPagePosition = _pageController.page ?? 0.0;

    // Calculate the target progress value (0.25, 0.50, 0.75, 1.0)
    final double targetProgress = (currentPagePosition + 1) / _numPages;

    // Animate the controller to the continuous position
    _animationController.animateTo(targetProgress);

    // Update the discrete index needed for the icon change
    setState(() {
      _currentPageIndex = currentPagePosition.round();
    });
  }

  @override
  void dispose() {
    _pageController.removeListener(_handlePageChange);
    _animationController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: _images.length,
              // Removed the onPageChanged: setState block since _handlePageChange does this
              itemBuilder: (BuildContext context, int index) {
                final textSizes = Theme.of(context).textTheme;
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        _images[index],
                        height: 250,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(height: 30),
                      Text(
                        _titles[index],
                        style: textSizes.headlineMedium,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        _descriptions[index],
                        style: textSizes.bodyMedium,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          // SmoothPageIndicator
          // ... (SmoothPageIndicator code is correct) ...
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: SmoothPageIndicator(
              controller: _pageController,
              count: _images.length,
              effect: WormEffect(
                dotHeight: 8,
                dotWidth: 8,
                spacing: 5,
                activeDotColor: Theme.of(context).primaryColor,
                dotColor: Colors.grey.shade300,
              ),
            ),
          ),

          // FIX: Correct AnimatedBuilder structure
          AnimatedBuilder(
            animation:
                _animationController, // Listens to the controller's continuous value
            builder: (context, child) {
              return GestureDetector(
                onTap: _nextPage,
                child: Container(
                  margin: const EdgeInsets.only(
                    bottom: 40.0,
                  ), // Add margin for spacing
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: 70,
                        height: 70,
                        child: CircularProgressIndicator(
                          value: _animationController
                              .value, // Driven by the smooth controller
                          strokeWidth: 3,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Theme.of(context).primaryColor,
                          ),
                          backgroundColor: Colors.grey.shade300,
                        ),
                      ),

                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          // Use the discrete index to change the icon
                          _currentPageIndex == _numPages - 1
                              ? Icons.check
                              : Icons.arrow_forward,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
