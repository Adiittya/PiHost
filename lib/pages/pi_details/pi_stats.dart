import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:pihost/constants.dart';

class PiStats extends StatefulWidget {
  const PiStats({super.key});

  @override
  State<PiStats> createState() => _PiStatsState();
}

class _PiStatsState extends State<PiStats> {
  final List<Map<String, dynamic>> deviceStat = [
    {
      'color': const Color(0xFFD27C2C),
      'icon': FontAwesomeIcons.temperatureHalf,
      'title': 'Temperature',
      'value': '--',
    },
    {
      'color': const Color(0xFF0FA958),
      'icon': FontAwesomeIcons.bolt,
      'title': 'Power',
      'value': '--',
    },
    {
      'color': const Color(0xFF9747FF),
      'icon': FontAwesomeIcons.memory,
      'title': 'Memory',
      'value': '--',
    },
    {
      'color': const Color(0xFFF24E1E),
      'icon': FontAwesomeIcons.microchip,
      'title': 'CPU',
      'value': '--',
    },
    {
      'color': const Color(0xFF9747FF),
      'icon': FontAwesomeIcons.memory,
      'title': 'Memory',
      'value': '--',
    },
    {
      'color': const Color(0xFFF24E1E),
      'icon': FontAwesomeIcons.microchip,
      'title': 'CPU',
      'value': '--',
    },
  ];

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.34,
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              scrollDirection: Axis.horizontal,
              scrollBehavior: const MaterialScrollBehavior(),
              itemCount: (deviceStat.length / 4).ceil(),
              itemBuilder: (context, pageIndex) {
                int startIndex = pageIndex * 4;
                int endIndex = startIndex + 4;
                List<Map<String, dynamic>> pageItems = deviceStat.sublist(
                  startIndex,
                  endIndex > deviceStat.length ? deviceStat.length : endIndex,
                );
                return Padding(
                  padding: const EdgeInsets.all(5),
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: pageItems.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 1.6,
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: deviceList,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FaIcon(
                              pageItems[index]['icon'],
                              color: pageItems[index]['color'],
                              size: 20,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              pageItems[index]['title'],
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                              ),
                            ),
                            Text(
                              pageItems[index]['value'],
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 0.0, right: 10),
            child: Center(
              child: SmoothPageIndicator(
                controller: _pageController,
                count: (deviceStat.length / 4).ceil(),
                effect: ExpandingDotsEffect(
                  dotHeight: 8,
                  dotWidth: 8,
                  activeDotColor: Colors.blueAccent,
                  dotColor: Colors.grey.shade400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
