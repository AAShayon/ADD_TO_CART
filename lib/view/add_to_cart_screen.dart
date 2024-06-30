import 'package:add_to_cart/utils/colors.dart';
import 'package:add_to_cart/utils/text_styles.dart';
import 'package:add_to_cart/view/widget/animation.dart';
import 'package:add_to_cart/viewModel/food_view_model.dart';
import 'package:any_image_view/any_image_view.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class AddToCartScreen extends StatefulWidget {
  const AddToCartScreen({super.key});

  @override
  State<AddToCartScreen> createState() => _AddToCartScreenState();
}

class _AddToCartScreenState extends State<AddToCartScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final foodViewModel = Provider.of<FoodViewModel>(context, listen: false);
      foodViewModel.FoodListFetch(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FoodViewModel>(
      builder: (context, foodViewModel, child) {
        final menu = foodViewModel.menu;

        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 15.h),
                    child: Container(
                      height: 478.h,
                      width: 328.w,
                      color: AppColors.baseColorOffWhite,
                      child: Column(
                        children: [
                          Container(
                            height: 60.h,
                            width: 328.w,
                            decoration: const BoxDecoration(
                              gradient: AppColors.linearGradient,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(top: 10.h, left: 10.w),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        'Breakfast',
                                        style: TextStyles.caption1Strong(
                                            AppColors.baseColorWhite),
                                      ),
                                      Text(
                                        'Vat(5%) Service Charge(5%)',
                                        style: TextStyles.body2(
                                            AppColors.baseColorWhite),
                                      ),
                                    ],
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.keyboard_arrow_up,
                                      color: AppColors.baseColorWhite,
                                      size: 25.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 20.h),
                          foodViewModel.isLoadingState
                              ? Center(
                                  child: CircularProgressIndicator(
                                      color: AppColors.primaryColor),
                                )
                              : menu != null
                                  ? SizedBox(
                                      height: 376.h,
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        physics:
                                            const AlwaysScrollableScrollPhysics(),
                                        itemCount: menu.length,
                                        itemBuilder: (context, index) {
                                          return FadeInAnimation(
                                            direction: FadeInDirection.btt,
                                            delay: .5 + index,
                                            fadeOffset: index == 0 ? 80 : 80.0 * index,
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 10.h),
                                              child: Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                    children: [
                                                      DottedBorder(
                                                        color: AppColors
                                                            .primaryColor,
                                                        borderType:
                                                            BorderType.RRect,
                                                        strokeWidth: 1.w,
                                                        radius:
                                                            const Radius.circular(
                                                                10),
                                                        child: Container(
                                                          height: 80.h,
                                                          width: 80.w,
                                                          decoration:
                                                              const BoxDecoration(
                                                            color: AppColors
                                                                .baseColorLightOrange,
                                                          ),
                                                          child: Padding(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        10.w,
                                                                    vertical:
                                                                        10.w),
                                                            child: CircleAvatar(
                                                              backgroundColor:
                                                                  Colors.black,
                                                              child: AnyImageView(
                                                                imagePath:
                                                                    '${menu[index].image}',
                                                                width: 51.w,
                                                                height: 51.h,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            '${menu[index].name}',
                                                            style: TextStyles
                                                                .body2Strong(AppColors
                                                                    .baseColorBlack),
                                                          ),
                                                          SizedBox(
                                                            width: 129.w,
                                                            child: Text(
                                                              '${menu[index].description}',
                                                              style: TextStyles
                                                                  .body1(AppColors
                                                                      .baseColorOffWhiteShade),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            '\$${menu[index].price}',
                                                            style: TextStyles
                                                                .body1Strong(
                                                                    const Color(
                                                                        0xff02308E)),
                                                          ),
                                                          foodViewModel
                                                                      .getItemCount(
                                                                          index) >
                                                                  0
                                                              ? Container(
                                                                  height: 20.h,
                                                                  width: 60.w,
                                                                  decoration: BoxDecoration(
                                                                      color: Colors
                                                                          .transparent,
                                                                      borderRadius: BorderRadius.circular(3),
                                                                      border: Border.all(
                                                                          color: AppColors
                                                                              .primaryColor)),
                                                                  child: Row(
                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                    children: [
                                                                      InkWell(
                                                                        child: Icon(Icons.remove, size: 10.sp),
                                                                        onTap: (){
                                                                          foodViewModel.decrementItemCount(index);
                                                                        },
                                                                      ),
                                                                      Text(
                                                                        '${foodViewModel.getItemCount(index)}',
                                                                      ),
                                                                      InkWell(
                                                                        child:Icon(
                                                                            Icons.add,
                                                                            size: 10.sp) ,
                                                                        onTap: (){
                                                                          foodViewModel.incrementItemCount(index);
                                                                        },
                                                                      ),
                                                                    ],
                                                                  ),
                                                                )
                                                              : GestureDetector(
                                                                  onTap: () {
                                                                    foodViewModel
                                                                        .incrementItemCount(
                                                                            index);
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: AppColors
                                                                          .baseColorOffWhite,
                                                                      border: Border.all(
                                                                          color: AppColors
                                                                              .primaryColor),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsets.symmetric(
                                                                          horizontal: 20
                                                                              .w,
                                                                          vertical:
                                                                              5.h),
                                                                      child: Text(
                                                                        'Add',
                                                                        style: TextStyles.body1(
                                                                            AppColors
                                                                                .baseColorBlack),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                )
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height: 10.h),
                                                  // Add some space between rows
                                                  AnyImageView(
                                                      imagePath:
                                                          'assets/dotline.png',
                                                      boxFit: BoxFit.fill),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    )
                                  : Center(
                                      child: Text(
                                        'No menu items available.',
                                        style: TextStyles.body1(
                                            AppColors.baseColorBlack),
                                      ),
                                    ),
                        ],
                      ),
                    ),
                  ),
                  foodViewModel.isLoadingState
                      ? Center(
                    child: CircularProgressIndicator(
                        color: AppColors.primaryColor),
                  ):menu !=null ?
                  Container(
                    height: 200.h,
                    decoration: const BoxDecoration(
                      color: AppColors.baseColorLightOrange,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 30.h, horizontal: 30.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Subtotal',
                                style: TextStyles.body3Strong(
                                    AppColors.baseColorBlack),
                              ),
                              Text(
                                '\$${foodViewModel.getSubtotal()}',
                                style: TextStyles.body2Strong(
                                    AppColors.primaryColor),
                              ),
                            ],
                          ),
                          SizedBox(height: 15.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Vat(5%) Service Charge included (5%)',
                                style:
                                    TextStyles.body2(const Color(0xff02308E)),
                              ),
                              Text(
                                '\$${foodViewModel.getVat()}',
                                style: TextStyles.body2Strong(
                                    AppColors.baseColorBlack),
                              ),
                            ],
                          ),
                          SizedBox(height: 10.h),
                          Container(height: 1.h, color: AppColors.primaryColor),
                          SizedBox(height: 10.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total',
                                style: TextStyles.body3Strong(
                                    AppColors.baseColorBlack),
                              ),
                              Text(
                                '\$${foodViewModel.getTotal()}',
                                style: TextStyles.caption1Strong(
                                    AppColors.primaryColor),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ):SizedBox.shrink(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
