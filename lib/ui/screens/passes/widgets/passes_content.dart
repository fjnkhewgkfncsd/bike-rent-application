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

  void onClickSubscription(Pass pass){
    DateTime now = DateTime.now() ;
    passesVM.userSubscriptPass(pass.passtype,now.add(Duration(days: 30)) );
  }

  void toPassDetails(BuildContext context,Pass pass) {
    Navigator.push(context,
      MaterialPageRoute(builder: (context) => PassDetailsScreen(pass: pass,onClickSubscription:() => onClickSubscription(pass))),
    );
  }

  String getSubTitle(Pass pass){
    switch(pass.passtype){
      case 'day':
        return '\$${pass.price} / day';
      case 'monthly':
        return '\$${pass.price} / month';
      case 'annual':
        return '\$${pass.price} / year';
      default:
        return '';
    }
  }

  IconData getLeadingIcon(Pass pass){
    switch(pass.passtype){
      case 'day':
        return Icons.calendar_today;
      case 'monthly':
        return Icons.calendar_view_month;
      case 'annual':
        return Icons.calendar_view_day_rounded;
      default:
        return Icons.calendar_today;
    }
  }

  String getValidUntilText(DateTime expiryDate){
    return '${expiryDate.day}/${expiryDate.month}/${expiryDate.year}';
  }

  @override
  Widget build(BuildContext context) {

    final state = passesVM.state;

    Widget content;

    switch(state.state){
      case AsyncValueState.loading:
        content = Center(child: CircularProgressIndicator());
        break;
      case AsyncValueState.error:
        content = Center(child: Text(state.error != null ? 'There is something wrong': 'error'));
        break;
      case AsyncValueState.success:
        if(passesVM.userState.user!.isPassActive){
          content = Padding(
            padding: const EdgeInsets.symmetric(vertical: AppSpacing.md, horizontal: AppSpacing.lg),
            child: Column(
              children : [
                ...passesVM.passes.map((pass){
                  return Padding(
                    padding: const EdgeInsets.only(bottom: AppSpacing.md),
                    child: GenericListTile(
                      title: pass.passtype, 
                      backgroundColor: pass.passtype == passesVM.userState.user!.passType ? AppColors.info : AppColors.lightgrey,
                      subtitle: getSubTitle(pass),
                      trailing: pass.passtype == passesVM.userState.user!.passType ? 
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)
                        ),
                        child: Text('Active', style: TextStyle(color: AppColors.success, fontWeight: FontWeight.bold),),
                      ) : null,
                      leading: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.lightBlueAccent,
                        ),
                        child: Icon(getLeadingIcon(pass))),
                    ),
                  );}
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl, vertical: AppSpacing.lg),
                  decoration: BoxDecoration(
                    color: AppColors.background,
                    borderRadius: BorderRadius.circular(28),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Current Subscription',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Valid Until',
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColors.textMuted,
                            ),
                          ),
                          Text(
                            getValidUntilText(passesVM.userState.user!.passExpiryDate!),
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppColors.textPrimary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ]
            )
          );
        }else{
          content = Padding(
            padding: const EdgeInsets.symmetric(vertical: AppSpacing.md, horizontal: AppSpacing.lg),
            child: ListView.separated(
              itemBuilder: (context, index) {
                final pass = passesVM.passes[index];
                return GenericListTile(
                  title: pass.passtype,
                  trailing: Text('${pass.price} €'),
                  backgroundColor: AppColors.info,
                  onTap: () => toPassDetails(context, pass),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: 16);
              },
              itemCount: passesVM.passes.length,
            ),
          );
          break;
        }
        
    }
    return content;
  }
}