// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class OrderHistoryCard extends StatelessWidget {
  final DocumentSnapshot<Object?> orderData;

  const OrderHistoryCard({
    required this.orderData,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          height: 200,
                          width: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                  orderData['image'],
                                ),
                                fit: BoxFit.fill),
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      const Text(
                        'OrderId:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(orderData['orderId']),
                      const SizedBox(
                        height: 12,
                      ),
                      // Date
                      const Text('Date of Request: ',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(orderData['date']),
                      const SizedBox(
                        height: 12,
                      ),

                      // Items Requested for Pickup
                      const Text(
                        'Items:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Center(
                        child: Text(orderData['order']
                            .map((e) => e.toString())
                            .toList()
                            .join(', ')),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const Text('Status: ',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(orderData['status']),
                      const SizedBox(
                        height: 16,
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                      Center(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green[600],
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('OK'),
                        ),
                      ),
                    ],
                  ),
                );
              });
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          height: 120,
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [
              // Image
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                        orderData['image'],
                      ),
                      fit: BoxFit.fill),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              // Data
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Date: ${orderData['date']}'),
                    const SizedBox(
                      height: 8,
                    ),
                    Text('Request Time: ${orderData['time']}'),
                    const SizedBox(
                      height: 8,
                    ),
                    Text('Item count: ${orderData['order'].length}'),
                    const SizedBox(
                      height: 8,
                    ),
                    Text('Status: ${orderData['status']}'),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
