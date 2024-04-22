import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leprechaun/presentation/leaders/controller/controller.dart';
import 'package:leprechaun/presentation/leaders/widgets/leader_widget.dart';

class LeadersPage extends StatelessWidget {
  const LeadersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LeadersController());
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 22),
          const Text(
            'Leaders',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Top 10 advance to the next league',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 14,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          GetBuilder<LeadersController>(
            init: controller,
            builder: (leadersController) => Text(
              leadersController.remainingTime,
              style: const TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 14,
                color: Color(0xFFFFCB46),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: GetBuilder<LeadersController>(
              init: controller,
              builder: (leadersController) => leadersController.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            padding: const EdgeInsets.only(bottom: 90),
                            itemCount: leadersController.leaders.length,
                            itemBuilder: (context, index) {
                              return LeaderWidget(
                                index: index,
                                name:
                                    leadersController.leaders[index].name ?? '',
                                isSelected: index ==
                                    leadersController.selectedLeaderIndex,
                                onPressed:
                                    leadersController.updateSelectedLeaderIndex,
                              );
                            },
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
