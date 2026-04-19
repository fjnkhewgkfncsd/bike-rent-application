import 'package:bike_rental/domain/model/pass/pass.dart';
import 'package:bike_rental/ui/theme/theme.dart';
import 'package:flutter/material.dart';

class PassDetailsScreen extends StatelessWidget {
  final Pass pass;
  final VoidCallback onClickSubscription;

  const PassDetailsScreen({
    super.key,
    required this.pass,
    required this.onClickSubscription,
  });

  String getDisplayTitle(String type) {
    switch (type) {
      case 'day':
        return 'Day Pass';
      case 'monthly':
        return 'Monthly Pass';
      case 'annual':
        return 'Annual Pass';
      default:
        return type;
    }
  }

  String getPriceLabel() => '\$${pass.price.toStringAsFixed(2)}';

  List<String> getBenefits() {
    switch (pass.passtype) {
      case 'day':
        return const [
          'First 30 minutes free per trip',
          'Unlimited rides within 24 hours',
          'Access to all stations in the city',
        ];
      case 'monthly':
        return const [
          'Unlimited rides for 30 days',
          'Best for regular users',
          'Access to all stations in the city',
        ];
      case 'annual':
        return const [
          'Unlimited rides for 365 days',
          'Best value for long-term use',
          'Access to all stations in the city',
        ];
      default:
        return const [];
    }
  }

  IconData getBenefitIcon(int index) {
    switch (index) {
      case 0:
        return Icons.access_time_outlined;
      case 1:
        return Icons.sync;
      case 2:
        return Icons.location_on_outlined;
      default:
        return Icons.check_circle_outline;
    }
  }

  @override
  Widget build(BuildContext context) {
    final benefits = getBenefits();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(
          getDisplayTitle(pass.passtype),
          style: TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
            fontSize: AppFont.l,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: AppSpacing.xl,
                horizontal: AppSpacing.lg,
              ),
              decoration: BoxDecoration(
                color: AppColors.topnaviblue,
                borderRadius: BorderRadius.circular(AppBorder.lg),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    getDisplayTitle(pass.passtype),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: AppFont.xl,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  Text(
                    getPriceLabel(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  Text(
                    pass.description,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: AppFont.big,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: AppSpacing.lg,
                horizontal: AppSpacing.md,
              ),
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.circular(AppBorder.l),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "What's included",
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: AppFont.md,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.md),
                  ...List.generate(benefits.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: AppSpacing.md),
                      child: Row(
                        children: [
                          Container(
                            width: 34,
                            height: 34,
                            decoration: BoxDecoration(
                              color: Colors.blue.shade50,
                              borderRadius: BorderRadius.circular(AppBorder.sm),
                            ),
                            child: Icon(
                              getBenefitIcon(index),
                              color: AppColors.topnaviblue,
                              size: 18,
                            ),
                          ),
                          const SizedBox(width: AppSpacing.md),
                          Expanded(
                            child: Text(
                              benefits[index],
                              style: TextStyle(
                                color: AppColors.textPrimary,
                                fontSize: AppFont.big,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: SizedBox(
            height: 55,
            child: ElevatedButton.icon(
              onPressed: () {
                onClickSubscription();
                Navigator.pop(context);
              },
              icon: const Icon(Icons.airplane_ticket_outlined),
              label: const Text(
                'Subscribe',
                style: TextStyle(
                  fontSize: AppFont.md,
                  fontWeight: FontWeight.w500,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.topnaviblue,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppBorder.bi),
                ),
                elevation: 0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}