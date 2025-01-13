part of 'home_screen.dart';

abstract class HomeController extends State<HomeScreen> {

  int counter = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  void incrementCounter() {
    setState(() {
      counter++;
    });
  }

}