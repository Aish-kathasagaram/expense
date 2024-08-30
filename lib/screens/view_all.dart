// view_all.dart

import 'package:flutter/material.dart';
import 'package:mad_my_app/data/data.dart';

class ViewAllScreen extends StatelessWidget {
  const ViewAllScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Transactions'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: transactionsData.length,
          itemBuilder: (context, int i) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: transactionsData[i]['color'],
                                  shape: BoxShape.circle,
                                ),
                              ),
                              transactionsData[i]['icon'],
                            ],
                          ),
                          const SizedBox(width: 12),
                          Text(
                            transactionsData[i]['name'],
                            style: TextStyle(
                              fontSize: 14,
                              color: Theme.of(context).colorScheme.onBackground,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            transactionsData[i]['totalAmount'],
                            style: TextStyle(
                              fontSize: 14,
                              color: Theme.of(context).colorScheme.onBackground,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            transactionsData[i]['date'],
                            style: TextStyle(
                              fontSize: 14,
                              color: Theme.of(context).colorScheme.onBackground,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
