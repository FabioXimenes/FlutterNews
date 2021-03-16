# FlutterNews

![Preview-Screens](https://github.com/FabioXimenes/FlutterNews/blob/master/screenshots.png)

If you want to take a look on all screens of the app, they are [here](https://drive.google.com/drive/folders/1UCxfFbTSY_T_mFE2g1D9iFBh7_jmZrDu?usp=sharing)

## About this project

Follow the latest news, see news in your favorite category, do a more specific search or even save news to read when you have time! The app was built using [Mobx](https://github.com/mobxjs/mobx.dart) for state management and [Flutter Modular](https://github.com/Flutterando/modular) for project structure. Data from the [NewsAPI](https://newsapi.org/).

## Observations

- Ios is not working because I do not have a mac to make the firebase integration. I plan to add this feature when I have the opportunity!
- The app shows the title and a brief description of each article, and redirects to the url of the news to see the full article.

## Functionalities

- Login and Sign Up with Firebase (with email and password or with google)

- Recover password with Firebase

- See the top headlines articles

- Save articles to read later

- Read news from different categories (business, entertainment, general, health, science, sports and technology)

- Search
  - Search for news with particular words
  - Choose a time interval to search
  - Choose how to sort the news (relevancy, popularity or date)

- Bookmarks
  - Read your saved articles
  - Remove the articles from your bookmarks

- Settings
  - Change password with Firebase
  - Logout
  - Choose between the Dark and Light theme
  - See some information about the app 

## Built With

- [Mobx](https://pub.dev/packages/flutter_mobx)
- [Flutter Modular](https://pub.dev/packages/flutter_modular)
- [Firebase](https://firebase.google.com/?hl=pt-br)
- [google_sign_in](https://pub.dev/packages/google_sign_in)
- [url_launcher](https://pub.dev/packages/url_launcher)
- [shared_preferences](https://pub.dev/packages/shared_preferences)
- [intl](https://pub.dev/packages/intl)
- [flutter_svg](https://pub.dev/packages/flutter_svg)
- [flutter_masked_text](https://pub.dev/packages/flutter_masked_text)
- [asuka](https://pub.dev/packages/asuka)
- [dio](https://pub.dev/packages/dio)
- [json_annotation](https://pub.dev/packages/json_annotation)
- [json_serializable](https://pub.dev/packages/json_serializable)


## Getting Started

**Cloning this repository**
```
$ git clone https://github.com/FabioXimenes/FlutterNews
$ cd FlutterNews
```
**Installing dependencies**
```
flutter pub get
```

**Go to [NewsAPI](https://newsapi.org/register), register and get an API Key. Then create a .env file at the project root and paste your API Key in an API_KEY variable**
```
API_KEY=<YOUR_API_KEY>
```

**With all dependencies installed and API Key set you can run the app**
```
flutter run
```
