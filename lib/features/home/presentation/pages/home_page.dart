import 'package:auto_route/auto_route.dart';
import 'package:edhub_flutter_app/core/constants/constants.dart';
import 'package:edhub_flutter_app/core/router/data/app_router.dart';
import 'package:edhub_flutter_app/core/services/app_services.dart';
import 'package:edhub_flutter_app/core/utils/screen_util/screen_util.dart';
import 'package:edhub_flutter_app/features/home/domain/entities/category.dart';
import 'package:flutter/material.dart';

List<Category> categoryList = [
  const Category(
    title: 'Learn',
    subtitle: 'Study about any topic.',
    thumbnailUrl: '',
    routePage: LearnRoute(),
  ),
  const Category(
    title: 'Master',
    subtitle: 'Self-evaluate with personalised quizes.',
    thumbnailUrl: '',
    routePage: MasterRoute(),
  ),
  const Category(
    title: 'Compete',
    subtitle: 'Engage in group quizes / test series.',
    thumbnailUrl: '',
    routePage: CompeteRoute(),
    isUnderDevelopment: true,
  ),
  const Category(
    title: 'Guidance',
    subtitle: 'Your personal counselor. Ask Anything!',
    thumbnailUrl: '',
    routePage: MasterRoute(),
    isUnderDevelopment: true,
  ),
];

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: AppPaddings.paddingScaffold,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 40.h),
            Text(
              'Welcome to EdHub!',
              style: AppTextStyles.clashDisplay.s40.w6,
            ),
            Expanded(
              child: GridView.builder(
                itemCount: categoryList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.w,
                  mainAxisSpacing: 16.h,
                ),
                itemBuilder: (ctx, index) {
                  return GestureDetector(
                    onTap: () {
                      AppServices.router.push(categoryList[index].routePage);
                    },
                    child: Card(
                      elevation: 8,
                      child: Container(
                        padding: AppPaddings.symmetric.h12.v12,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              categoryList[index].title,
                              style: AppTextStyles.clashDisplay.s16.w5,
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              categoryList[index].subtitle,
                              style: AppTextStyles.clashDisplay.s14.w4,
                            ),
                            if (categoryList[index].isUnderDevelopment) ...{
                              SizedBox(height: 8.h),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.info,
                                    color: AppColors.pureWhite,
                                    size: 12.r,
                                  ),
                                  SizedBox(width: 8.w),
                                  Text(
                                    'Under development',
                                    style: AppTextStyles.clashDisplay.s10.w8,
                                  ),
                                ],
                              ),
                            },
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
