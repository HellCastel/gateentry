import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:ge_process/utils/datewidget.dart';
import 'package:ge_process/utils/dropdownfile.dart';
import 'package:ge_process/utils/elevatedbutton.dart';
import 'package:ge_process/utils/fonts.dart';
import 'package:ge_process/utils/textformfieldwidget.dart';
import 'package:ionicons/ionicons.dart';

class Mainscreen extends StatefulWidget {
  Mainscreen({super.key});

  @override
  State<Mainscreen> createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<bool> completedTabs = [false, false, false];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) return;
      setState(() {
        completedTabs[_tabController.index] = true;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  String? selectedGateNo;

  List<String> gateNo = ["Chennai", "Coimbatore", "Madurai", "Trichy"];

  final dateController = TextEditingController();
  final ddController = TextEditingController();
  final invDateController = TextEditingController();

  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: screenHeight * 0.3,
            color: Colors.blue.shade900,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset("assets/img/abc.png", height: 50, width: 50),
                    Row(
                      children: [
                        AvatarGlow(
                          glowColor: Colors.white,
                          glowShape: BoxShape.circle,
                          animate: true,
                          glowRadiusFactor: 0,
                          curve: Curves.fastOutSlowIn,
                          repeat: false,
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Ionicons.notifications_circle,
                              size: 40,
                              color: Colors.white,
                            ),
                            tooltip: "Notifications",
                          ),
                        ),
                        SizedBox(width: 20),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            "Log Out",
                            style: CommonText.textDataBlock12Bgrey().copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Divider(color: Colors.white, thickness: 0.2),
                SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Gate Entry Registration",
                      style: CommonText.textDataBlock16B().copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(top: screenHeight * 0.20),
              width: screenWidth * 0.9,
              height: screenHeight * 0.75,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1))],
              ),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      // gradient: LinearGradient(
                      //   colors: [Colors.blue.shade50, Colors.blue.shade100],
                      //   begin: Alignment.topLeft,
                      //   end: Alignment.bottomRight,
                      // ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TabBar(
                      controller: _tabController,
                      tabs: const [
                        Tab(text: "Header"),
                        Tab(text: "Hand Delivery"),
                        Tab(text: "Table"),
                      ],
                      labelStyle: CommonText.textDataBlock12B(),
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.blueGrey,
                      indicator: BoxDecoration(
                        color: Colors.blue.shade900,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      indicatorSize: TabBarIndicatorSize.tab,
                    ),
                  ),
                  Expanded(
                    child: AnimatedSwitcher(
                      duration: Duration(milliseconds: 100),
                      transitionBuilder: (child, animation) =>
                          FadeTransition(opacity: animation, child: child),
                      child: TabBarView(
                        key: ValueKey<int>(_tabController.index),
                        controller: _tabController,
                        children: [
                          buildHeaderTab(),
                          buildHandDeliveryTab(),
                          buildTabelTab(screenWidth),
                        ],
                      ),
                    ),
                  )

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Center buildHandDeliveryTab() {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue.shade50,
              Colors.blue.shade100,
              Colors.blue.shade50,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: Column(
          children: [
            // Row 1: Vehicle Number + Type of Vehicle
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.directions_car,
                                  size: 18,
                                  color: Colors.blue.shade900,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "Vehicle Number",
                                  style: CommonText.textDataBlock12B(),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: CustomTextFieldCard(
                              hintText: "Vehicle Number",
                              onChanged: (value) {},
                              textLength: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 100),
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.local_shipping,
                                  size: 18,
                                  color: Colors.blue.shade900,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "Type of Vehicle",
                                  style: CommonText.textDataBlock12B(),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: CustomDropdownCard(
                              value: selectedGateNo,
                              hintText: "Type of Vehicle",
                              items: gateNo,
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

            SizedBox(height: 20),

            // Row 2: Driver Name + Courier Name
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.person,
                                  size: 18,
                                  color: Colors.blue.shade900,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "Driver Name",
                                  style: CommonText.textDataBlock12B(),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: CustomTextFieldCard(
                              hintText: "Driver Name",
                              textLength: 20,
                              inputType: TextInputType.name,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 100),
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.business,
                                  size: 18,
                                  color: Colors.blue.shade900,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "Courier Name",
                                  style: CommonText.textDataBlock12B(),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 4,
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

            SizedBox(height: 20),

            // Row 3: Courier Number + Document Date
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.confirmation_number,
                                  size: 18,
                                  color: Colors.blue.shade900,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "Courier Number",
                                  style: CommonText.textDataBlock12B(),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: CustomTextFieldCard(
                              hintText: "Courier Number",
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 100),
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.date_range,
                                  size: 18,
                                  color: Colors.blue.shade900,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "Document Date",
                                  style: CommonText.textDataBlock12B(),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 4,
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
              ],
            ),

            SizedBox(height: 20),

            // Row 4: Shipment Number
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.local_post_office,
                                  size: 18,
                                  color: Colors.blue.shade900,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "Shipment Number",
                                  style: CommonText.textDataBlock12B(),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: CustomTextFieldCard(
                              hintText: "Shipment Number",
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 100),
                Expanded(child: Container()),
              ],
            ),

            SizedBox(height: 85),

            // Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonButton(
                  text: "Previous",
                  onPressed: () {
                    _tabController.animateTo(_tabController.index - 1);
                  },
                ),
                CommonButton(
                  text: "Save & Next",
                  onPressed: () {
                    _tabController.animateTo(_tabController.index + 1);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Center buildTabelTab(double screenWidth) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue.shade50,
              Colors.blue.shade100,
              Colors.blue.shade50,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: Column(
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.receipt_long,
                                  size: 18,
                                  color: Colors.blue.shade900,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "Invoice Number",
                                  style: CommonText.textDataBlock12B(),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: CustomTextFieldCard(
                              hintText: "Invoice Number",
                              onChanged: (value) {},
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.25),
                    // spacing between the two groups
                    Expanded(
                      flex: 2,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.date_range,
                                  size: 18,
                                  color: Colors.blue.shade900,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "Invoice Date",
                                  style: CommonText.textDataBlock12B(),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: CustomDateFieldCard(
                              hintText: "Document Date",
                              controller: invDateController,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(height: 30),
            Table(
              border: TableBorder.all(color: Colors.black, width: 1),
              // full grid borders
              columnWidths: {
                0: FlexColumnWidth(),
                1: FlexColumnWidth(),
                2: FlexColumnWidth(),
                3: FlexColumnWidth(),
                4: FlexColumnWidth(),
              },
              children: [
                TableRow(
                  decoration: BoxDecoration(color: Colors.green),
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
                TableRow(
                  children: [
                    _buildCell("003"),
                    _buildCell("Widget C"),
                    _buildCell("5"),
                    _buildCell("\$8"),
                    _buildCell("\$40"),
                  ],
                ),
                TableRow(
                  children: [
                    _buildCell("004"),
                    _buildCell("Widget D"),
                    _buildCell("5"),
                    _buildCell("\$8"),
                    _buildCell("\$40"),
                  ],
                ),
                TableRow(
                  children: [
                    _buildCell("005"),
                    _buildCell("Widget E"),
                    _buildCell("5"),
                    _buildCell("\$8"),
                    _buildCell("\$40"),
                  ],
                ),
              ],
            ),

            SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonButton(
                  text: "Previous",
                  onPressed: () {
                    _tabController.animateTo(_tabController.index - 1);
                  },
                ),
                CommonButton(text: "Submit", onPressed: () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Center buildHeaderTab() {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue.shade50,
              Colors.blue.shade100,
              Colors.blue.shade50,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
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
                            child: Row(
                              children: [
                                Icon(
                                  Icons.confirmation_number,
                                  size: 18,
                                  color: Colors.blue.shade900,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "Gate Entry Number",
                                  style: CommonText.textDataBlock12B(),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: CustomTextFieldCard(
                              hintText: "Gate Entry Number",
                              inputType: TextInputType.number,
                              textLength: 10,
                              onChanged: (value) {},
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 100), // optional spacing
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.date_range,
                                  size: 18,
                                  color: Colors.blue.shade900,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "Date",
                                  style: CommonText.textDataBlock12B(),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 4,
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
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.location_on_rounded,
                                  size: 18,
                                  color: Colors.blue.shade900,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "Location / Plant",
                                  style: CommonText.textDataBlock12B(),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 4,
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
                SizedBox(width: 100), // optional spacing
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.settings,
                                  size: 18,
                                  color: Colors.blue.shade900,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "GE Option",
                                  style: CommonText.textDataBlock12B(),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 4,
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
              ],
            ),
            SizedBox(height: 20),

            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.format_list_numbered,
                                  size: 18,
                                  color: Colors.blue.shade900,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "Total no of DC",
                                  style: CommonText.textDataBlock12B(),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 4,
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
                SizedBox(width: 100), // optional spacing
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.local_shipping,
                                  size: 18,
                                  color: Colors.blue.shade900,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "Mode Of Delivey",
                                  style: CommonText.textDataBlock12B(),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 4,
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
              ],
            ),
            SizedBox(height: 20),

            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.meeting_room_outlined,
                                  size: 18,
                                  color: Colors.blue.shade900,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "Gate No",
                                  style: CommonText.textDataBlock12B(),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 4,
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
                SizedBox(width: 100), // optional spacing
                Expanded(child: Container()),
              ],
            ),
            SizedBox(height: 100),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CommonButton(
                  text: "Save & Next",
                  onPressed: () {
                    _tabController.animateTo(_tabController.index + 1);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCell(String text, {bool isHeader = false}) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        text,
        style: isHeader
            ? CommonText.textDataBlock12Bgrey().copyWith(
          color: Colors.white,
        )
            : CommonText.textDataBlock12(),
      ),
    );
  }
}
