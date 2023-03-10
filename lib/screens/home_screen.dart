import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController(keepPage: true);

  @override
  void initState() {
    super.initState();

    // _pageController.addListener(() {
    //   Future.delayed(
    //     const Duration(seconds: 5),
    //     () {
    //       if (_pageController.page == 4) {
    //         _pageController.animateToPage(0,
    //             duration: const Duration(seconds: 1),
    //             curve: Curves.easeInQuint);
    //       } else {
    //         _pageController.nextPage(
    //             duration: const Duration(seconds: 1),
    //             curve: Curves.easeOutQuint);
    //       }
    //     },
    //   );
    // });

    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   while (true) {
    //     Future.delayed(
    //       const Duration(seconds: 5),
    //       () {
    //         _pageController.nextPage(
    //             duration: const Duration(seconds: 1),
    //             curve: Curves.easeOutQuint);
    //       },
    //     );
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            PageView(
              controller: _pageController,
              children: List.generate(
                5,
                (index) => Image.asset(
                  'assets/images/$index.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              height: 100,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(.5),
                    Colors.black.withOpacity(.4),
                    Colors.black.withOpacity(.3),
                    Colors.transparent
                  ],
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Auth demo',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                  PopupMenuButton(
                    child: Row(
                      children: const [
                        Text('Profile', style: TextStyle(color: Colors.white)),
                        SizedBox(width: 10),
                        CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/login_picture.jpg'),
                        )
                      ],
                    ),
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        child: const Text('Logout'),
                        onTap: () {
                          context.go('/signup');
                        },
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

