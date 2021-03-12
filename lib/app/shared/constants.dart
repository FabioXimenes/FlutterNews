const String BASE_URL = 'http://newsapi.org/v2';

enum UserStatus { stopped, loading, success, error }

class AppRoutes {
  static const login = '/login';
  static const signUp = '/signUp';
  static const start = '/start';
  static const trending = '/trending';
}

class AppStorage {
  static const bookmarks = 'bookmarks';
  static const themeMode = 'themeMode';
}

class ApiUrls {
  static const topHeadlines = '/top-headlines';
  static const everything = '/everything';
  static const sources = '/sources';
}
