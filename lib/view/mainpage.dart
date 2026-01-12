import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:ge_process/utils/datewidget.dart';
import 'package:ge_process/utils/dropdownfile.dart';
import 'package:ge_process/utils/fonts.dart';
import 'package:ge_process/utils/textformfieldwidget.dart';
import 'package:ionicons/ionicons.dart';
import 'package:rainbow_edge_lighting/rainbow_edge_lighting.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  final colorizeColors = [
    Colors.purple,
    Colors.blue,
    Colors.yellow,
    Colors.red,
  ];

  String? selectedGateNo;

  List<String> gateNo = ["Chennai", "Coimbatore", "Madurai", "Trichy"];

  final dateController = TextEditingController();
  final ddController = TextEditingController();
  final invDateController = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        toolbarHeight: 100,
        elevation: 10,
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurple, Colors.blueAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
        ),
        centerTitle: true,
        title: AnimatedTextKit(
          animatedTexts: [
            ColorizeAnimatedText(
              'Gate Entry Process',
              textStyle: CommonText.textDataBlock15(),
              colors: [
                Colors.white,
                Colors.black,
                Colors.white12,
              ],
            ),
          ],
          isRepeatingAnimation: true,
        ),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Ionicons.menu, size: 28, color: Colors.white),
          tooltip: "Menu",
        ),
        actions: [
          AvatarGlow(
            glowColor: Colors.white,
            glowShape: BoxShape.circle,
            animate: true,
            glowRadiusFactor: 1,
            curve: Curves.fastOutSlowIn,
            repeat: true,
            child: IconButton(
              onPressed: () {
              },
              icon: Icon(
                Ionicons.notifications_circle,
                size: 40,
                color: Colors.white,
              ),
              tooltip: "Notifications",
            ),
          ),
          SizedBox(
            width: 20,
          ),
          RainbowEdgeLighting(
            glowEnabled: true,
            colors: [Colors.green, Colors.black87],
            radius: 40,
            thickness: 2.0,
            enabled: true,
            speed: 0.2,
            clip: true,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Ionicons.person_circle, size: 28, color: Colors.blueAccent),
            ),
          ),
          SizedBox(width: 15),
        ],
      ),

      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          clipBehavior: Clip.none,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: AnimatedTextKit(
                    animatedTexts: [
                      BounceAnimatedText('Header',textStyle: CommonText.textDataBlock16B(),),
                      BounceAnimatedText('Header',textStyle: CommonText.textDataBlock16B(),),
                      BounceAnimatedText('Header',textStyle: CommonText.textDataBlock16B(),),
                    ]
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Card(
                color: Colors.white,
                elevation: 20,
                shadowColor: Colors.blueAccent.shade200,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        "Gate Entry Number",
                                        style: CommonText.textDataBlock12B(),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 5,
                                      child: CustomTextFieldCard(
                                        hintText: "Gate Entry Number",
                                        onChanged: (value) {},
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 50), // optional spacing
                          Expanded(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        "Date",
                                        style: CommonText.textDataBlock12B(),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 5,
                                      child: CustomDateFieldCard(
                                        hintText: "Select Date",
                                        controller: dateController,
                                        onDateSelected: (date) {
                                          print("Selected date: $date");
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 50), // optional spacing
                          Expanded(child: Container()),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        "Location / Plant",
                                        style: CommonText.textDataBlock12B(),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 5,
                                      child: CustomDropdownCard(
                                        value: selectedGateNo,
                                        hintText: "Select Location / Plant",
                                        items: gateNo, // <-- only names
                                        onChanged: (value) {
                                          setState(() {
                                            selectedGateNo = value;
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 50), // optional spacing
                          Expanded(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        "GE Option",
                                        style: CommonText.textDataBlock12B(),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 5,
                                      child: CustomDropdownCard(
                                        value: selectedGateNo,
                                        hintText: "Select GE Option",
                                        items: gateNo, // <-- only names
                                        onChanged: (value) {
                                          setState(() {
                                            selectedGateNo = value;
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 50), // optional spacing
                          Expanded(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        "Gate No",
                                        style: CommonText.textDataBlock12B(),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 5,
                                      child: CustomDropdownCard(
                                        value: selectedGateNo,
                                        hintText: "Select Gate No",
                                        items: gateNo, // <-- only names
                                        onChanged: (value) {
                                          setState(() {
                                            selectedGateNo = value;
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        "Total no of DC",
                                        style: CommonText.textDataBlock12B(),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 5,
                                      child: CustomDropdownCard(
                                        value: selectedGateNo,
                                        hintText: "Total no of DC",
                                        items: gateNo, // <-- only names
                                        onChanged: (value) {
                                          setState(() {
                                            selectedGateNo = value;
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 50), // optional spacing
                          Expanded(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        "Mode Of Delivey",
                                        style: CommonText.textDataBlock12B(),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 5,
                                      child: CustomDropdownCard(
                                        value: selectedGateNo,
                                        hintText: "Mode Of Delivery",
                                        items: gateNo, // <-- only names
                                        onChanged: (value) {
                                          setState(() {
                                            selectedGateNo = value;
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 50), // optional spacing
                          Expanded(child: Container()),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: AnimatedTextKit(
                    animatedTexts: [
                      BounceAnimatedText('Hand Delivery',textStyle: CommonText.textDataBlock16B(),),
                      BounceAnimatedText('Hand Delivery',textStyle: CommonText.textDataBlock16B(),),
                      BounceAnimatedText('Hand Delivery',textStyle: CommonText.textDataBlock16B(),),
                    ]
                ),
              ),
              SizedBox(height: 15),
              Card(
                color: Colors.white,
                elevation: 20,
                shadowColor: Colors.blueAccent.shade200,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        "Vehicle Number",
                                        style: CommonText.textDataBlock12B(),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 5,
                                      child: CustomTextFieldCard(
                                        hintText: "Vehicle Number",
                                        onChanged: (value) {},
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 50), // optional spacing
                          Expanded(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        "Type of Vehicle",
                                        style: CommonText.textDataBlock12B(),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 5,
                                      child: CustomDropdownCard(
                                        value: selectedGateNo,
                                        hintText: "Type of Vehicle",
                                        items: gateNo, // <-- only names
                                        onChanged: (value) {
                                          setState(() {
                                            selectedGateNo = value;
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 50), // optional spacing
                          Expanded(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        "Driver Name",
                                        style: CommonText.textDataBlock12B(),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 5,
                                      child: CustomTextFieldCard(
                                        hintText: "Driver Name",
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        "Courier Number",
                                        style: CommonText.textDataBlock12B(),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 5,
                                      child: CustomTextFieldCard(
                                        hintText: "Courier Number",
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 50), // optional spacing
                          Expanded(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        "Document Date",
                                        style: CommonText.textDataBlock12B(),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 5,
                                      child: CustomDateFieldCard(
                                        hintText: "Document Date",
                                        controller: ddController,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 50), // optional spacing
                          Expanded(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        "Courier Name",
                                        style: CommonText.textDataBlock12B(),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 5,
                                      child: CustomTextFieldCard(
                                        hintText: "Courier Name",
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        "Shipment Number",
                                        style: CommonText.textDataBlock12B(),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 5,
                                      child: CustomTextFieldCard(
                                        hintText: "Shipment Number",
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 50), // optional spacing
                          Expanded(child: Container()),
                          SizedBox(width: 50), // optional spacing
                          Expanded(child: Container()),
                        ],
                      ),

                      SizedBox(height: 15),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: AnimatedTextKit(
                    animatedTexts: [
                      BounceAnimatedText('Table',textStyle: CommonText.textDataBlock16B(),),
                      BounceAnimatedText('Table',textStyle: CommonText.textDataBlock16B(),),
                      BounceAnimatedText('Table',textStyle: CommonText.textDataBlock16B(),),
                    ]
                ),
              ),
              SizedBox(height: 10),
              Card(
                color: Colors.white,
                elevation: 20,
                shadowColor: Colors.blueAccent.shade200,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        "Invoice Number",
                                        style: CommonText.textDataBlock12B(),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 5,
                                      child: CustomTextFieldCard(
                                        hintText: "Invoice Number",
                                        onChanged: (value) {},
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 16), // spacing between the two groups
                              Expanded(
                                flex: 1,
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        "Invoice Date",
                                        style: CommonText.textDataBlock12B(),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 5,
                                      child: CustomDateFieldCard(
                                        hintText: "Document Date",
                                        controller: invDateController,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                      ,
                      SizedBox(
                        height: 12,
                      ),
                      Table(
                        border: TableBorder.all(color: Colors.black, width: 1),
                        // full grid borders
                        columnWidths: const {
                          0: FlexColumnWidth(),
                          1: FlexColumnWidth(),
                          2: FlexColumnWidth(),
                          3: FlexColumnWidth(),
                          4: FlexColumnWidth(),
                        },
                        children: [
                          TableRow(
                            children: [
                              _buildCell("Item Number", isHeader: true),
                              _buildCell("Description", isHeader: true),
                              _buildCell("Quantity", isHeader: true),
                              _buildCell("Price", isHeader: true),
                              _buildCell("Total", isHeader: true),
                            ],
                          ),
                          TableRow(
                            children: [
                              _buildCell("001"),
                              _buildCell("Widget A"),
                              _buildCell("10"),
                              _buildCell("\$5"),
                              _buildCell("\$50"),
                            ],
                          ),
                          TableRow(
                            children: [
                              _buildCell("002"),
                              _buildCell("Widget B"),
                              _buildCell("5"),
                              _buildCell("\$8"),
                              _buildCell("\$40"),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCell(String text, {bool isHeader = false}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: isHeader
            ? CommonText.textDataBlock12Bgrey()
            : CommonText.textDataBlock12(),
      ),
    );
  }
}