import 'package:flutter/material.dart';
import '../models/news.dart';
import '../repos/home_repo.dart';

class NewsProvider with ChangeNotifier {
  final HomeRepo _homeRepo = HomeRepo();

  News? _news;
  String? _errorMessage;
  bool _isLoading = false;

  News? get news => _news;
  String? get errorMessage => _errorMessage;
  bool get isLoading => _isLoading;

  Future<void> fetchHeadlines(String countryCode) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _news = await _homeRepo.getHeadlines(countryCode);
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}