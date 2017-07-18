# StockMasterSDKUpdate
Demo for Aston integrating Cocoapods + Carthage

### Issue
TradeIt SDK requires Frameworks but existing dependencies include static binaries. This is the error given building Aston's Podfile after adding `use_frameworks!`

```
[!] The 'Pods-StockMasterSDKUpdate' target has transitive dependencies that include static binaries: (/Users/jsom/workspace/StockMasterSDKUpdate/Pods/OpenSSL-Universal/lib-ios/libcrypto.a and /Users/jsom/workspace/StockMasterSDKUpdate/Pods/OpenSSL-Universal/lib-ios/libssl.a)
```

The OpenSSL dependency comes from the Mosquitto dependency. This is a known issue on Cocoapods and the situation is evolving but isn't resolved. See here for one of many threads about it: https://github.com/CocoaPods/CocoaPods/issues/6848

### Solution 1 - Use Carthage to add TradeItSDK
This is used by a couple of partners who run in to the issue above. I have provided a sample implementation here. Note the demo configures the build settings to include Carthage frameworks correctly, but only has a button to demo launch a screen from the SDK.

To setup:
```
git clone git@github.com:tradingticket/StockMasterSDKUpdate.git
pod install
carthage update
open StockMasterSDKUpdate.xcworkspace
```

### Solution 2 - Look at removing dependency
Depends on how the Mosquitto library is being used. If just the client is used and not the server, potentially look at switching to just a client library like [MQTTClient](https://github.com/ckrey/MQTT-Client-Framework).

### Solution 3 - Manually link Mosquitto library and remove from Podfile
This is an option if a single package manager is desirable. You would need to compile the Mosquitto dependency and vendor the framework.
