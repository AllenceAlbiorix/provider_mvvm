import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ny_times_app/src/core/router/app_go_router.dart';
import 'package:ny_times_app/src/core/router/app_route_enum.dart';

class ArrowBackButtonWidget extends StatelessWidget {
  final Function()? callback;
  final Color? iconColor;

  const ArrowBackButtonWidget({Key? key, this.callback, this.iconColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: IconButton(
        onPressed: () {
          // GoRouter.of(context).routerDelegate.currentConfiguration.matches.toList() ;
          callback?.call();
          if (context.canPop()) {
            context.pop();
          } else {
            context.replaceNamed(AppRouteEnum.articlesPage.name);
          }
        },
        constraints: const BoxConstraints(),
        padding: EdgeInsets.zero,
        icon: Icon(
          Icons.arrow_back,
          color: iconColor ?? Theme.of(context).iconTheme.color,
        ),
      ),
    );
  }
}
