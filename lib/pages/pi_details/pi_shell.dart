import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pihost/constants.dart';
import 'package:pihost/controllers/controllers.dart';

class PiShell extends StatefulWidget {
  const PiShell({super.key});

  @override
  State<PiShell> createState() => _PiShellState();
}

class _PiShellState extends State<PiShell> {
  final SwitchController switchController = Get.put(SwitchController());
  final TextEditingController _commandTitle = TextEditingController();
  final TextEditingController _command = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10),
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.5,
      child: SingleChildScrollView(
        // Wrap with SingleChildScrollView
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Terminal',
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 10),
                FaIcon(
                  FontAwesomeIcons.terminal,
                  color: Colors.grey[400],
                  size: 14,
                ),
              ],
            ),
            Obx(() {
              return switchController.toggleAddCommand.value
                  ? Column(
                      children: [
                        Container(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                              style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.all<Color?>(delete),
                                overlayColor: MaterialStateProperty.all<Color?>(
                                    Colors.transparent),
                              ),
                              onPressed: switchController.toggleCommandView,
                              child: const Text(
                                "Cancel",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )),
                        ),
                        Container(
                            padding: const EdgeInsets.all(20),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: const Color(0xFF2A2A2A),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Form(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Execute your command",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  TextFormField(
                                      controller: _commandTitle,
                                      style:
                                          const TextStyle(color: Colors.white),
                                      decoration: const InputDecoration(
                                        labelText: 'Command Title',
                                        labelStyle: TextStyle(
                                            color: Colors.white, fontSize: 13),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                        ),
                                      ),
                                      onChanged: (value) => {}),
                                  const SizedBox(height: 10),
                                  TextFormField(
                                    maxLines: null,
                                    controller: _command,
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                    decoration: const InputDecoration(
                                      suffix: FaIcon(
                                        FontAwesomeIcons.solidStar,
                                        color: Colors.grey,
                                        size: 14,
                                      ),
                                      labelText: 'Command',
                                      labelStyle: TextStyle(
                                          color: Colors.white, fontSize: 13),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                      ),
                                    ),
                                    onChanged: (value) => {},
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      const Text(
                                        "The Command Is Valid",
                                        style: TextStyle(
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                        ),
                                      ),
                                      const Spacer(),
                                      Container(
                                        alignment: Alignment.centerRight,
                                        child: TextButton(
                                            style: ButtonStyle(
                                              foregroundColor:
                                                  MaterialStateProperty.all<
                                                      Color?>(Colors.white),
                                              overlayColor:
                                                  MaterialStateProperty.all<
                                                          Color?>(
                                                      Colors.transparent),
                                            ),
                                            onPressed: () {},
                                            child: const Text(
                                              "Validate",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            )),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )),
                      ],
                    )
                  : Center(
                      child: TextButton.icon(
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all<Color?>(
                              const Color(0xFFAEAEAE)),
                          iconSize: MaterialStateProperty.all<double>(15),
                          overlayColor: MaterialStateProperty.all<Color?>(
                              Colors.transparent),
                        ),
                        icon: const FaIcon(FontAwesomeIcons.plus),
                        label: const Text('Add Command'),
                        onPressed: switchController.toggleCommandView,
                      ),
                    );
            })
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _commandTitle.dispose();
    _command.dispose();
  }
}
