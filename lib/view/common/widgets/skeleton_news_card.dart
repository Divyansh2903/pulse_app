import 'dart:math';
import 'package:attento_assignment/view/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class NewsHomeCardSkeleton extends StatelessWidget {
  const NewsHomeCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color:Colors.grey.shade200,
          borderRadius: BorderRadius.circular(20),
        ),
        height: ScreenUtil().screenHeight * 0.6,
        padding: EdgeInsets.all(20),
        child: Shimmer(
          gradient: LinearGradient(
            colors: [
              Colors.grey.shade300,
              Colors.grey.shade400,
              Colors.grey.shade300,
            ],
            stops: [
              0.4,
              0.5,
              0.6,
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 50.h,
                width: double.infinity,
                color: Colors.grey.shade300,
              ),
              SizedBox(height: 8),
              Container(
                height: 12,
                width: 120,
                color: Colors.grey.shade300,
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 16,
                        backgroundColor: Colors.grey.shade300,
                      ),
                      SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 12,
                            width: 80,
                            color: Colors.grey.shade300,
                          ),
                          SizedBox(height: 4),
                          Container(
                            height: 12,
                            width: 100,
                            color: Colors.grey.shade300,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16),
              Container(
                height: 150.h,
                width: double.infinity,
                color: Colors.grey.shade300,
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey.shade300,
                      ),
                      padding: EdgeInsets.all(6),
                      child: Icon(Icons.thumb_up_outlined, color: Colors.brown)),
                  SizedBox(width: 16),
                  Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey.shade300,
                      ),
                      padding: EdgeInsets.all(6),
                      child: Icon(Icons.bookmark_add_outlined, color: Colors.brown)),
                  SizedBox(width: 16),
                  Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey.shade300,
                      ),
                      padding: EdgeInsets.all(6),
                      child: Icon(Icons.ios_share_sharp, color: Colors.brown)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}