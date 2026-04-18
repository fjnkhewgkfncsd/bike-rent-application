import 'package:bike_rental/domain/model/pass/pass.dart';
import 'package:flutter/material.dart';

class PassDetailsScreen extends StatelessWidget {
  final Pass pass;
  final VoidCallback onClickSubscription; 

  const PassDetailsScreen({super.key, required this.pass, required this.onClickSubscription});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pass.passtype),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              decoration: BoxDecoration(
              color: Colors.blue,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children : [
                  Text(
                    pass.description,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Price: \$${pass.price.toStringAsFixed(2)}',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ]
              )
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              padding : const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              decoration: BoxDecoration(
                color: const Color(0xFFF3F3F3),
                borderRadius: BorderRadius.circular(28),
              ),
              child : Column(
                children : [
                  Text('Description'),
                  Text(pass.description)
                ]
              )
            )
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            height: 55,
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {
                onClickSubscription();
                Navigator.pop(context);
              },
              icon: const Icon(Icons.airplane_ticket),
              label: const Text('Subscribe'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2D63C8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}