import 'package:bike_rental/domain/model/pass/pass.dart';
import 'package:bike_rental/ui/theme/theme.dart';
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
        backgroundColor: AppColors.lighterdeepBlue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: AppSpacing.md, horizontal: AppSpacing.lg),
              decoration: BoxDecoration(
              color: AppColors.info,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children : [
                  Text(
                    pass.description,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(height: AppSpacing.md),
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
              padding : const EdgeInsets.symmetric(vertical: AppSpacing.md, horizontal: AppSpacing.lg),
              decoration: BoxDecoration(
                color: AppColors.background,
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
              label: Text(
                'Subscribe for \$${pass.price.toStringAsFixed(2)}',
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.lighterdeepBlue,
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