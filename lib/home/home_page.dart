import 'package:exp_note/form/form_screen.dart';
import 'package:exp_note/constant/search_bar.dart';
import 'package:exp_note/form/form_services.dart';
import 'package:exp_note/home/container_home_body.dart';
import 'package:exp_note/report/report_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:preload_page_view/preload_page_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _page = 0;

  late PreloadPageController pageController;
  FormServices formServices = Get.put(FormServices());

  String dateToday = DateFormat("dd-MM-yyyy").format(DateTime.now());

  List<Widget> pages = [
    Container(),
    const ReportBody(),
  ];

  @override
  void initState() {
    super.initState();
    addFirstPage();
  }

  void addFirstPage() async {
    pages[0] =
        ContainerHomeBody(dataToday: await formServices.getExp2(dateToday));
    setState(() {});
  }

  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // toolbarHeight: 60,
        // backgroundColor: Colors.transparent,
        // elevation: 0,
        title: const SearchBar(),
      ),
      body: pages[_page],
      floatingActionButton: floatingFunc(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              // color: Colors.white,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.analytics,
              // color: Colors.white,
            ),
            label: 'Report',
          ),
        ],
        currentIndex: _page,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.blue.withOpacity(0.5),
        elevation: 4,
        onTap: updatePage,
      ),
    );
  }

  Widget floatingFunc() {
    if (_page == 0) {
      return FloatingActionButton(
        onPressed: () async {
          await Get.to(
            () => const FormScreen(),
            transition: Transition.rightToLeft,
          );
          pages[0] = ContainerHomeBody(
              dataToday: await formServices.getExp2(dateToday));
          setState(() {});
        },
        tooltip: 'Add Exp',
        child: const Icon(Icons.add),
      );
    } else {
      return Container();
    }
  }
}
