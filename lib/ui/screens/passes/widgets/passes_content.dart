import 'package:bike_rental/domain/model/pass/pass.dart';
import 'package:bike_rental/ui/screens/pass/pass_details_screen.dart';
import 'package:bike_rental/ui/screens/passes/view_model/passes_view_model.dart';
import 'package:bike_rental/ui/theme/theme.dart';
import 'package:bike_rental/ui/widgets/generic_tile.dart';
import 'package:flutter/material.dart';
import '../../../utils/async_value.dart';

class PassesContent extends StatelessWidget {
  final PassesViewModel passesVM;
  const PassesContent({super.key,required this.passesVM});


  void onClickSubscription(Pass pass) {
    final now = DateTime.now();
    DateTime expiryDate;

    switch (pass.passtype) {
      case 'day':
        expiryDate = now.add(const Duration(days: 1));
        break;
      case 'monthly':
        expiryDate =
            DateTime(now.year, now.month + 1, now.day, now.hour, now.minute);
        break;
      case 'annual':
        expiryDate =
            DateTime(now.year + 1, now.month, now.day, now.hour, now.minute);
        break;
      default:
        expiryDate = now.add(const Duration(days: 30));
    }

    passesVM.userSubscriptPass(pass.passtype, expiryDate);
  }

  void toPassDetails(BuildContext context, Pass pass) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => PassDetailsScreen(
          pass: pass,
          onClickSubscription: () => onClickSubscription(pass),
        ),
      ),
    );
  }

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

  String getSubTitle(Pass pass) {
    switch (pass.passtype) {
      case 'day':
        return '\$${pass.price.toStringAsFixed(2)} / day';
      case 'monthly':
        return '\$${pass.price.toStringAsFixed(2)} / month';
      case 'annual':
        return '\$${pass.price.toStringAsFixed(2)} / year';
      default:
        return '';
    }
  }

  IconData getLeadingIcon(String type) {
    switch (type) {
      case 'day':
        return Icons.wb_sunny_outlined;
      case 'monthly':
        return Icons.calendar_month_outlined;
      case 'annual':
        return Icons.star_border;
      default:
        return Icons.calendar_today;
    }
  }

  String getValidUntilText(DateTime expiryDate) {
    final hour = expiryDate.hour.toString().padLeft(2, '0');
    final minute = expiryDate.minute.toString().padLeft(2, '0');
    return '${expiryDate.day}/${expiryDate.month}/${expiryDate.year} - $hour:$minute';
  }

  Widget buildMyPassTile(Pass pass, bool isActive) {
    return Container(
      decoration: BoxDecoration(
        color: isActive ? AppColors.topnaviblue : AppColors.background,
        borderRadius: BorderRadius.circular(AppBorder.md),
        border: isActive
            ? null
            : Border.all(color: AppColors.surface, width: 1.2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm,
        ),
        leading: Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: isActive
                ? Colors.white.withOpacity(0.18)
                : const Color(0xFFF2F5FB),
            borderRadius: BorderRadius.circular(AppBorder.bi),
          ),
          child: Icon(
            getLeadingIcon(pass.passtype),
            color: isActive ? Colors.white : AppColors.topnaviblue,
            size: AppFont.l,
          ),
        ),
        title: Text(
          getDisplayTitle(pass.passtype),
          style: TextStyle(
            color: isActive ? Colors.white : AppColors.textPrimary,
            fontWeight: FontWeight.w600,
            fontSize: AppFont.md,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: AppSpacing.xs),
          child: Text(
            getSubTitle(pass),
            style: TextStyle(
              color: isActive ? Colors.white70 : AppColors.textMuted,
              fontSize: AppFont.bi,
            ),
          ),
        ),
        trailing: isActive
            ? Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.md,
                  vertical: AppSpacing.sm,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFDDF8DF),
                  borderRadius: BorderRadius.circular(AppBorder.xl),
                ),
                child: Text(
                  'Active',
                  style: TextStyle(
                    color: AppColors.success,
                    fontWeight: FontWeight.w600,
                    fontSize: AppFont.bi,
                  ),
                ),
              )
            : const Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: AppColors.textMuted,
              ),
      ),
    );
  }

  Widget buildSubscriptionCard(DateTime expiryDate) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.lg,
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
            'Current Subscription',
            style: TextStyle(
              fontSize: AppFont.md,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Valid Until',
                style: TextStyle(
                  fontSize: AppFont.big,
                  color: AppColors.textMuted,
                ),
              ),
              Text(
                getValidUntilText(expiryDate),
                style: TextStyle(
                  fontSize: AppFont.big,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    switch (passesVM.state.state) {
      case AsyncValueState.loading:
        return const Center(child: CircularProgressIndicator());

      case AsyncValueState.error:
        return Center(
          child: Text(
            passesVM.state.error != null ? 'There is something wrong' : 'error',
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: AppFont.md,
            ),
          ),
        );

      case AsyncValueState.success:
        final user = passesVM.userState.user!;
        final passes = passesVM.passes;

        if (user.isPassActive) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              vertical: AppSpacing.md,
              horizontal: AppSpacing.lg,
            ),
            child: Column(
              children: [
                ...passes.map((pass) {
                  final isActive = pass.passtype == user.passType;
                  return Padding(
                    padding: const EdgeInsets.only(bottom: AppSpacing.md),
                    child: buildMyPassTile(pass, isActive),
                  );
                }),
                const SizedBox(height: AppSpacing.sm),
                buildSubscriptionCard(user.passExpiryDate!),
              ],
            ),
          );
        }

        return Padding(
          padding: const EdgeInsets.symmetric(
            vertical: AppSpacing.md,
            horizontal: AppSpacing.lg,
          ),
          child: ListView.separated(
            itemCount: passes.length,
            separatorBuilder: (_, _) => const SizedBox(height: AppSpacing.md),
            itemBuilder: (context, index) {
              final pass = passes[index];
              return GenericListTile(
                title: getDisplayTitle(pass.passtype),
                trailing: Text(
                  '\$${pass.price.toStringAsFixed(2)}',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: AppFont.l,
                  ),
                ),
                backgroundColor: AppColors.topnaviblue,
                titleColor: Colors.white,
                onTap: () => toPassDetails(context, pass),
              );
            },
          ),
        );
    }
  }
}