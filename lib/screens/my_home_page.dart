import 'package:calculator/my_flutter_app_icons.dart';
import 'package:calculator/screens/calculator.dart';
import 'package:calculator/screens/history.dart';
import 'package:calculator/screens/scientific_calculator.dart';
import 'package:calculator/widgets/global/calculation_part.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  // final BuildContext context;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {
  // Variable to detect swipe direction
  late DragStartDetails _startDragDetails;
  late DragUpdateDetails _updateDragDetails;
  late double _startHistoryTop;

  final ScrollController historyScroll = ScrollController();
  // Variable to set history animation
  final int _durationStackAnimation = 700;
  // Variable that make sure screen orientation set only once in didChangeDependencies method
  bool _runFirstTime = true;

  // Variable to detect screen orientation/height and set history offset
  double _screenHeight = 0;
  double _historyTop = -999999999999999;
  Orientation _screenOrientation = Orientation.portrait;

  // Variable to set current index of bottom navigation
  int _selectedIndex = 0;

  // List of screen based on bottom navigation
  final List<Widget> _bottomNavigationScreens = [
    const Calculator(),
    ScientificCalculator()
  ];

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    WidgetsBinding.instance.addObserver(this);
    historyScroll.addListener(() => onScroll());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _screenHeight = MediaQuery.of(context).size.height;
    if (_historyTop != 0) {
      _historyTop = -_screenHeight;
    }
    if (_runFirstTime) {
      _screenOrientation = MediaQuery.of(context).orientation;
      _runFirstTime = false;
    }
    if (_screenOrientation == Orientation.landscape) {
      _selectedIndex = 1;
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    historyScroll.removeListener(() => onScroll());
    super.dispose();
  }

  // method that run every time orientation changes
  @override
  void didChangeMetrics() {
    final currentOrientation =
        WidgetsBinding.instance.window.physicalSize.aspectRatio > 1
            ? Orientation.landscape
            : Orientation.portrait;
    if (currentOrientation != _screenOrientation) {
      _screenOrientation = currentOrientation;
      if (currentOrientation == Orientation.landscape) {
        _selectedIndex = 1;
      } else {
        _selectedIndex = 0;
      }
      setState(() {});
    }
  }

  // Method to open history with tap on history icon
  void openHistoryMethod() {
    _historyTop = 0;
    setState(() {});
  }

  // Method that run on click of bottom navigation icon
  void _onBottomNavigationChange(index) {
    if (index == 1) {
      SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
      _screenOrientation = Orientation.landscape;
    } else {
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
      SystemChrome.setPreferredOrientations([]);
      _screenOrientation = Orientation.portrait;
    }
    setState(() {
      _selectedIndex = index;
    });
  }

  void onScroll() {
    if (historyScroll.offset == 0) {
      _historyTop = -_screenHeight;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onBottomNavigationChange,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.calculate), label: "Simple Calculator"),
          BottomNavigationBarItem(
              icon: Icon(MyIcons.squareRoot), label: "Scientific Calculator"),
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const CalculationPart(),
                _bottomNavigationScreens.elementAt(_selectedIndex),
              ],
            ),
            AnimatedPositioned(
              duration: Duration(milliseconds: _durationStackAnimation),
              curve: Curves.slowMiddle,
              top: _historyTop,
              child: GestureDetector(
                onVerticalDragStart: (drag) {
                  _startDragDetails = drag;
                  _startHistoryTop = _historyTop;
                },
                onVerticalDragUpdate: (drag) {
                  _updateDragDetails = drag;
                  double dy = _updateDragDetails.globalPosition.dy -
                      _startDragDetails.globalPosition.dy;
                  if ((dy < -100 && _startHistoryTop != -_screenHeight) ||
                      (dy > 100 && _startHistoryTop != 0)) {
                    _historyTop =
                        -(_screenHeight - _updateDragDetails.globalPosition.dy);
                    setState(() {});
                  }
                },
                onVerticalDragEnd: (drag) {
                  double dy = _updateDragDetails.globalPosition.dy -
                      _startDragDetails.globalPosition.dy;
                  if (dy < -100) {
                    _historyTop = -_screenHeight;
                  } else if (dy > 100) {
                    _historyTop = 0;
                  } else {
                    if (_historyTop != 0 && _historyTop != -_screenHeight) {
                      _historyTop = 0;
                    }
                  }
                  setState(() {});
                },
                child: History(
                  openHistoryMethod: openHistoryMethod,
                  historyScroll: historyScroll,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
