import 'package:attento_assignment/view/common/utils/timeAgo.dart';
import 'package:attento_assignment/view/common/widgets/skeleton_news_card.dart';
import 'package:attento_assignment/view/screens/home/views/news_detail_view.dart';
import 'package:attento_assignment/view/utils/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../view_model/home_provider.dart';
import '../../common/widgets/news_home_card.dart';
import '../../constants/colors.dart';
import '../../constants/textstyles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<NewsProvider>(context, listen: false).fetchHeadlines('us');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final newsProvider = Provider.of<NewsProvider>(context);
    debugPrint("NEWS PROVIDER: ${newsProvider.news}");
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        surfaceTintColor: AppColors.backgroundColor,
        title: Text(
          "Pulse",
          style: headingTextStyle.copyWith(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              SizedBox(height: 20.h),
              if (newsProvider.isLoading)
                Flexible(
                    child: CardSwiper(

                        padding: EdgeInsets.zero,
                        backCardOffset: Offset(0, 45),
                        isLoop: true,
                        cardsCount: 5,
                        cardBuilder: (context, index, percentThresholdX,
                            percentThresholdY) {
                         

                          return NewsHomeCardSkeleton();
                        }))
              else if (newsProvider.errorMessage != null)
                Center(
                  child: Text(
                    newsProvider.errorMessage!,
                    style: TextStyle(color: Colors.red, fontSize: 16),
                  ),
                )
              else if (newsProvider.news != null)
                Flexible(
                    child: CardSwiper(

                      padding: EdgeInsets.zero,
                        backCardOffset: Offset(0, 45),
                        isLoop: true,
                        cardsCount: newsProvider.news!.articles.length,
                        cardBuilder: (context, index, percentThresholdX,
                            percentThresholdY) {
                          final article = newsProvider.news!.articles[index];
                          final cardColor =
                              AppColors.cardColors.elementAt(index % 4);
                          return NewsHomeCard(

                            cardColor: cardColor,
                            onTap: () {
                           navigate(context, NewsDetailView(article: article, bgColor: cardColor));
                            },
                           article: article,
                          );
                        }))
              // Expanded(
              //   child: ListView.builder(
              //     itemCount: newsProvider.news!.articles.length,
              //     itemBuilder: (context, index) {
              //       final article = newsProvider.news!.articles[index];
              //       final cardColor = AppColors.cardColors.elementAt(index % 4);
              //       return NewsHomeCard(
              //         cardColor: cardColor,
              //         title: article.title,
              //         author: article.author ?? "Unknown Author",
              //         description: article.description,
              //         updatedTime: timeAgo(article.publishedAt),
              //         url: article.url,
              //         urlToImage: article.urlToImage??'',
              //       );
              //     },
              //   ),
              // )
              else
                const Center(child: Text("No news available")),
            ],
          ),
        ),
      ),
    );
  }
}
