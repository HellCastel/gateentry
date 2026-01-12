import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:ge_process/utils/fonts.dart';
import 'package:ionicons/ionicons.dart';

class ExpandDesign extends StatefulWidget {
  const ExpandDesign({super.key});

  @override
  State<ExpandDesign> createState() => _ExpandDesignState();
}

class _ExpandDesignState extends State<ExpandDesign> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: screenHeight * 0.35,
            color: Colors.blue.shade900,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                            icon: const Icon(
                              Ionicons.notifications_circle,
                              size: 40,
                              color: Colors.white,
                            ),
                            tooltip: "Notifications",
                          ),
                        ),
                        const SizedBox(width: 20),
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
                const SizedBox(height: 5),
                const Divider(color: Colors.white, thickness: 0.2),
                const SizedBox(height: 5),
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

          // Expansion panels positioned below header
          Padding(
            padding: EdgeInsets.only(top: screenHeight * 0.20),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(color: Colors.grey.shade300),
                    ),
                    child: ExpansionTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.purple.shade100,
                        child: const Icon(
                          Icons.directions_car,
                          color: Colors.purple,
                        ),
                      ),
                      title: const Text('Basic Information'),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 4,
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: 'Vehicle Number',
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                flex: 2,
                                child: Image.network(
                                  "https://media.giphy.com/media/3o6Zt481isNVuQI1l6/giphy.gif",
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Panel 2: Materials & Documents
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(color: Colors.grey.shade300),
                    ),
                    child: ExpansionTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.purple.shade100,
                        child: const Icon(
                          Icons.inventory,
                          color: Colors.purple,
                        ),
                      ),
                      title: const Text('Materials & Documents'),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 4,
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: 'Item Description',
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                flex: 2,
                                child: Image.network(
                                  "https://media.giphy.com/media/l0MYt5jPR6QX5pnqM/giphy.gif",
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Panel 3: Security & Approval
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(color: Colors.grey.shade300),
                    ),
                    child: ExpansionTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.purple.shade100,
                        child: const Icon(
                          Icons.verified_user,
                          color: Colors.purple,
                        ),
                      ),
                      title: const Text('Security & Approval'),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 4,
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: 'Approver Name',
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                flex: 2,
                                child: Image.network(
                                  "https://media.giphy.com/media/26ufdipQqU2lhNA4g/giphy.gif",
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
