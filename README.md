![image](https://user-images.githubusercontent.com/2886217/144180884-cca481f7-2f61-4391-92c6-42ac3319867f.png)

Buy the Dip is a stock prediction app using Python flask for the backend and Google Flutter for the frontend. Using a trained neural network, the app recommends buy, hold, or sell signals for stocks. The factors involved are:
- CNN's Fear and Greed Index
  - Support for Alternative's Bitcoin Fear and Greed Index  
- Technical indicators
  - RSI
  - Slow stochastic
  - MACD
- Twitter sentiment analysis
- Reddit sentiment analysis

Planned future factors to be involved were:
- Google Trends
- Stock volatility

## Screenshots

![image](https://user-images.githubusercontent.com/2886217/144181597-11b471fe-3e33-4a1a-b7cf-c01d16085141.png)
![image](https://user-images.githubusercontent.com/2886217/144181860-edc192d9-fa85-4866-881e-cdd30b456474.png)


## Backend Setup

The following modules are needed to run this server:
```
pip install flask, fear-and-greed, finnhub-python
```

A finnhub API key is required for this server.

A `config.json` must be made set up like this:
```json
{
  "finnhub_api_key": "your finnhub api key"
}
```

## Frontend Setup

The following are requirements to run the frontend:

- [Flutter](https://flutter.dev/docs/get-started/install)
- [Android SDK](https://developer.android.com/studio#downloads) (if using Android to run)
    - Download the "Command line tools only," unless one wishes to use Android Studio to develop (recommended if one 
    doesn't have IntelliJ Ultimate)
- [Gradle](https://gradle.org/install/) (if using Android to run)
    - [Java](https://www.java.com/)
- [Xcode](https://developer.apple.com/xcode/) (if using iOS to run)

After installing the tools, run the following command to check if Flutter is installed properly:
```
flutter doctor
```
Resolve all problems found.

#### If Using Android to Run

After installing the tools, set up a device using the AVD Manager. Then, run the AVD instance.

After the AVD instance sets up, run the following command:

```
flutter run
```

#### If Using iOS to Run

After installing the tools, set up a device using the Simulator application. Then, run the Simulator.

After the Simulator is set up, run the following command:
```
flutter run
```
