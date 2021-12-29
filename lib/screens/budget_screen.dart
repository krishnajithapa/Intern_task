import 'package:flutter/material.dart';
import 'package:task/colors.dart';
import 'package:task/models/budget_entry.dart';
import 'package:task/screens/screens.dart';

class BudgetScreen extends StatelessWidget {
  const BudgetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          elevation: 1,
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(40),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text(
                  "May",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
            ),
          ),
          actions: [
            Row(
              children: [
                Icon(
                  Icons.add_box_outlined,
                  color: Colors.blue.shade300,
                ),
                Text(
                  "Add Budget",
                  style: TextStyle(
                      color: Colors.blue.shade300,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ],
            ),
          ],
        ),
        body: TabBarView(
          children: [
            ListView(
              padding: const EdgeInsets.all(12),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: budgetEntries
                  .map((budgetEntry) =>
                      ExpenditureCard(budgetEntry: budgetEntry))
                  .toList(),
            ),
            Tab(icon: Icon(Icons.home)),
            Tab(icon: Icon(Icons.content_copy)),
            ZhiftScreen(),
          ],
        ),
        bottomNavigationBar: const TabBar(
          indicatorSize: TabBarIndicatorSize.label,
          indicatorColor: Colors.blue,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.black,
          tabs: [
            Tab(icon: Icon(Icons.dashboard)),
            Tab(icon: Icon(Icons.insert_drive_file_outlined)),
            Tab(icon: Icon(Icons.card_giftcard)),
            Tab(icon: Icon(Icons.settings)),
          ],
        ),
      ),
    );
  }
}

class ExpenditureCard extends StatelessWidget {
  const ExpenditureCard({
    Key? key,
    required this.budgetEntry,
  }) : super(key: key);

  final BudgetEntry budgetEntry;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: budgetcardColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AspectRatio(
          aspectRatio: 21 / 7,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Row(
                    children: [
                      budgetEntry.icon,
                      Text(
                        budgetEntry.title,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white30,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    width: 50,
                    height: 25,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: chipColor),
                      child: Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Row(
                          children: const [
                            Icon(
                              Icons.edit,
                              size: 16,
                              color: Colors.grey,
                            ),
                            Text(
                              "Edit",
                              style: TextStyle(color: Colors.grey),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const Text(
                        "Activities",
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(
                        '\$${budgetEntry.actMoney}.00',
                        style: TextStyle(
                            color: budgetEntry.color,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Text(
                        "Budget",
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(
                        '\$${budgetEntry.budgetMoney}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox.square(
                    dimension: 50,
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: CircularProgressIndicator(
                            value: budgetEntry.totalPercentUsed / 100.0,
                            color: budgetEntry.color,
                            strokeWidth: 8,
                          ),
                        ),
                        Center(
                          child: Text(
                            '${budgetEntry.totalPercentUsed}%',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
