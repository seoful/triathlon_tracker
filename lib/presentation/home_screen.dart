import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:triathlon_tracker/presentation/landing_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: SvgPicture.asset('assets/icons/user.svg'),
          ),
        ],
      ),
      backgroundColor: const Color(0xFFE0F0FF),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Column(
          children: const [
            SizedBox(height: 20),
            HeaderBar(),
            SizedBox(height: 48),
            SwimmingIndicator(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 30),
              child: CyclingIndicator(),
            ),
            RunningIndicator(),
          ],
        ),
      ),
    );
  }
}

class HeaderBar extends StatelessWidget {
  const HeaderBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Welcome, Lee!',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Color(0xFF40445C),
          ),
        ),
        Image.asset(
          'assets/images/waving_hand.png',
          scale: 3,
        ),
      ],
    );
  }
}

class GoalIndicator extends StatelessWidget {
  final double progress;
  const GoalIndicator({
    super.key,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: double.infinity,
              height: 8,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                color: Colors.white,
              ),
            ),
            AnimatedContainer(
              width: (MediaQuery.of(context).size.width - 32) * progress,
              duration: const Duration(milliseconds: 300),
              height: 8,
              curve: Curves.easeIn,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                color: Color(0xFF4A4999),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class SwimmingIndicator extends StatefulWidget {
  const SwimmingIndicator({super.key});

  @override
  State<SwimmingIndicator> createState() => _SwimmingIndicatorState();
}

class _SwimmingIndicatorState extends State<SwimmingIndicator> {
  int _currentProgress = 0;
  final int _total = 300;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showValueWindow(
          context,
          title: 'Enter your Swimming Training',
          hintText: '$_currentProgress',
        ).then((value) {
          if (value != null) {
            setState(() {
              _currentProgress = int.parse(value);
            });
          }
        });
      },
      child: Container(
        color: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Swimming',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      '$_currentProgress/$_total',
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                const Text(
                  'Log',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF4A6680),
                  ),
                ),
                const SizedBox(width: 8),
                const Icon(
                  Icons.add_rounded,
                  color: Color(0xFF4A6680),
                  size: 18,
                ),
                const SizedBox(width: 4),
              ],
            ),
            const SizedBox(height: 11),
            GoalIndicator(
              progress: _format(_currentProgress / _total),
            )
          ],
        ),
      ),
    );
  }
}

class CyclingIndicator extends StatefulWidget {
  const CyclingIndicator({super.key});

  @override
  State<CyclingIndicator> createState() => _CyclingIndicatorState();
}

class _CyclingIndicatorState extends State<CyclingIndicator> {
  int _currentProgress = 0;
  final int _total = 300;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showValueWindow(
          context,
          title: 'Enter your Cycling Training',
          hintText: '$_currentProgress',
        ).then((value) {
          if (value != null) {
            setState(() {
              _currentProgress = int.parse(value);
            });
          }
        });
      },
      child: Container(
        color: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Cycling',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      '$_currentProgress/$_total',
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                const Text(
                  'Log',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF4A6680),
                  ),
                ),
                const SizedBox(width: 8),
                const Icon(
                  Icons.add_rounded,
                  color: Color(0xFF4A6680),
                  size: 18,
                ),
                const SizedBox(width: 4),
              ],
            ),
            const SizedBox(height: 11),
            GoalIndicator(
              progress: _format(_currentProgress / _total),
            )
          ],
        ),
      ),
    );
  }
}

class RunningIndicator extends StatefulWidget {
  const RunningIndicator({super.key});

  @override
  State<RunningIndicator> createState() => _RunningIndicatorState();
}

class _RunningIndicatorState extends State<RunningIndicator> {
  int _currentProgress = 0;
  final int _total = 300;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showValueWindow(
          context,
          title: 'Enter your Running Training',
          hintText: '$_currentProgress',
        ).then((value) {
          if (value != null) {
            setState(() {
              _currentProgress = int.parse(value);
            });
          }
        });
      },
      child: Container(
        color: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Running',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      '$_currentProgress/$_total',
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                const Text(
                  'Log',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF4A6680),
                  ),
                ),
                const SizedBox(width: 8),
                const Icon(
                  Icons.add_rounded,
                  color: Color(0xFF4A6680),
                  size: 18,
                ),
                const SizedBox(width: 4),
              ],
            ),
            const SizedBox(height: 11),
            GoalIndicator(
              progress: _format(_currentProgress / _total),
            )
          ],
        ),
      ),
    );
  }
}

double _format(double value) {
  if (value > 1.0) {
    return 1.0;
  } else {
    return value;
  }
}

Future<String?> showValueWindow(
  BuildContext context, {
  required String title,
  required String hintText,
}) {
  final TextEditingController valueController = TextEditingController();
  return showModalBottomSheet(
    context: globalContext!,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(30),
      ),
    ),
    isScrollControlled: true,
    backgroundColor: Colors.white,
    builder: (_) {
      return IntrinsicHeight(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            children: [
              const SizedBox(height: 16),
              Container(
                width: 70,
                height: 5,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(100),
                  ),
                  color: Color(0xFFD6D7E4),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  bottom: 24,
                ),
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xFF40445C),
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              TextFormField(
                controller: valueController,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF40445C),
                ),
                cursorColor: const Color(0xFF4A4999),
                decoration: InputDecoration(
                  isDense: false,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 10,
                  ),
                  hintText: '$hintText km',
                  hintStyle: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF40445C),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(
                      color: Color(0xFF4A4999),
                      width: 2,
                    ),
                  ),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(color: Color(0xFFD6D7E4)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 40,
                  bottom: 30,
                ),
                child: AppButton(
                  onPressed: () {
                    if (valueController.text.isEmpty) {
                      Navigator.of(globalContext!).pop(hintText);
                    } else {
                      Navigator.of(globalContext!).pop(
                        valueController.text,
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

class AppButton extends StatelessWidget {
  final Function() onPressed;
  const AppButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0xFF4A4999),
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: const Center(
          child: Text(
            'Save',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
