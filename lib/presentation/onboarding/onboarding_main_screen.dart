import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../landing_screen.dart';
import 'custom_button.dart';
import 'custom_progress_bar.dart';
import 'name_screen.dart';
import 'options_screen.dart';

class OnBoardingMainScreen extends StatefulWidget {
  const OnBoardingMainScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingMainScreen> createState() => _OnBoardingMainScreenState();
}

class _OnBoardingMainScreenState extends State<OnBoardingMainScreen> {
  final PageController _pageController = PageController();
  final TextEditingController _nameController = TextEditingController();

  late final List<Widget> _onBoardingScreens = [
    NameScreen(nameController: _nameController),
    OptionsScreen(
      onChanged: (List<int>? value) {
        if (value != null) {
          _chosenOption = value!;
        }
      },
    ),
  ];

  late final int _totalScreens = _onBoardingScreens.length;

  int _currentIndex = 0;

  List<int> _chosenOption = [40, 500, 200];

  @override
  void initState() {
    super.initState();
    _nameController.addListener(() {});
  }

  _moveForward() async {
    _currentIndex++;
    setState(() {});
    _pageController.animateToPage(
      _currentIndex,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
  }

  _moveBackByTap() {
    _currentIndex -= 1;
    setState(() {});
    _pageController.animateToPage(
      _currentIndex,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        backgroundColor: const Color(0xFFE0F0FF),
        body: Stack(
          children: [
            GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: SafeArea(
                bottom: false,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20, top: 8),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 20, left: 8),
                        child: Row(
                          children: [
                            if (_currentIndex != _totalScreens) ...[
                              GestureDetector(
                                onTap: () {
                                  _moveBackByTap();
                                },
                                child: AnimatedOpacity(
                                  duration: const Duration(milliseconds: 200),
                                  opacity:
                                      _currentIndex == 0 || _currentIndex == 12
                                          ? 0
                                          : 1,
                                  child: AnimatedContainer(
                                    height: 30,
                                    width: _currentIndex == 0 ||
                                            _currentIndex == 12
                                        ? 0
                                        : 30,
                                    duration: const Duration(milliseconds: 200),
                                    color: Colors.transparent,
                                    alignment: Alignment.center,
                                    child: const Icon(
                                      CupertinoIcons.arrow_left,
                                      color: Color(0xFF2FD3C0),
                                      size: 18,
                                    ),
                                  ),
                                ),
                              )
                            ],
                            if (_currentIndex != _totalScreens) ...[
                              Expanded(
                                child: CustomProgressBar(
                                  progress: (_currentIndex + 1) / _totalScreens,
                                ),
                              )
                            ] else if (_currentIndex == _totalScreens) ...[
                              const Spacer(),
                              GestureDetector(
                                onTap: () {
                                  _moveBackByTap();
                                },
                                child: const Icon(
                                  CupertinoIcons.clear_circled,
                                  color: Color(0xFF2FD3C0),
                                ),
                              )
                            ]
                          ],
                        ),
                      ),
                      Expanded(
                        child: Stack(
                          children: [
                            PageView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              controller: _pageController,
                              onPageChanged: (index) {
                                setState(() {
                                  _currentIndex = index;
                                });
                              },
                              itemCount: _totalScreens,
                              itemBuilder: (context, index) {
                                return _onBoardingScreens[index];
                              },
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 20,
                                ),
                                child: CustomButton(
                                  title: 'Continue',
                                  onPressed: () async {
                                    if (_currentIndex == _totalScreens - 1) {
                                      Navigator.of(context).push(
                                        CupertinoPageRoute(
                                          builder: (context) => LandingScreen(
                                            name: _nameController.text,
                                            totals: _chosenOption,
                                          ),
                                        ),
                                      );
                                    } else {
                                      _moveForward();
                                    }
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
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
}
