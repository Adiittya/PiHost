import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pihost/constants.dart';

class AddPi extends StatefulWidget {
  const AddPi({super.key});

  @override
  State<AddPi> createState() => _AddPiState();
}

class _AddPiState extends State<AddPi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgColor,
        title: const Text('PiHost', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
      backgroundColor: bgColor,
      body: Container(
        margin: const EdgeInsets.all(20),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/icon.svg',
              width: 100,
              height: 100,
              colorFilter: const ColorFilter.mode(Color(0x0fffffff), BlendMode.srcIn),
            ),
            const SizedBox(height: 20),
            const Text("No Devices Connected", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            
          ],
        ),
      ),
    );
  }
}
