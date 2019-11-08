# The TechTalksPrimer Sample

This repository will help you learn some basic things about getting an application up and running for an iOS application.

The app pulls FAA Chart Supplement data from an open web service and displays the data in a list. The user selects a "page number" from the list. Then it displays the data on a detail page and displays a pdf that's based on a URL that came back from the response. The data in the pdf contains airport information for a few airports alphabetically.

### What this app will help you with...

* Make a Web Service call to an endpoint using a get request.
  + The app uses Alamofire to ease the pain
* Renders the Response data easily
  + The app uses the Codable protocol to render the objects easily
* Displays data on a List page from the WS call
  + It uses a Storyboard for this
* Display a Detail page that's linked via a Segue from the List page
  + It applys data from the List page to the Detail page
  + It uses the url supplied for each record and displays a PDF file on a specific page of an Airport Supplemental Chart

### What you need for most development...

This will be a required list for most development.

* macOS (Catalina) Version 10.5
* XCode 11.2 beta 2
  + Uusing Swift 5, the LATEST and greatest of Swift)
  + I have copies of XCode 10.0 - 11.2 if you need it on a portable hard drive.
  + ([Apple Developer website](https://developer.apple.com/))
* Brew
  + The missing package manager for macOS (or Linux))
  + https://brew.sh/
* CocoaPods
  + CocoaPods is a dependency manager for Swift and Objective-C Cocoa projects. It has over 67 thousand libraries and is used in over 3 million apps. CocoaPods can help you scale your projects elegantly.
  + The pods for this project are already in this repo, so technically you don't need it to run the project or run a `pod` command.
  + https://cocoapods.org/
  

### Add on development tools that I use

* Git Flow (an easier way for team collaboration and production rollout release management)
  + Command:  brew install git-flow
  + Or: https://github.com/nvie/gitflow/wiki/Mac-OS-X
  + https://www.atlassian.com/git/tutorials/comparing-workflows/gitflow-workflow
  + https://nvie.com/posts/a-successful-git-branching-model/

* Fastlane   (🚀 The easiest way to automate building and releasing your iOS and Android apps)
  + https://github.com/fastlane/fastlane
  
* SwifterSwift
  + A collection of over 500 native Swift extensions, with handy methods, syntactic sugar, and performance improvements for wide range of primitive data types, UIKit and Cocoa classes –over 500 in 1– for iOS, macOS, tvOS and watchOS. 
  + http://swifterswift.com/docs/
  + This is integrated into the project AND used in several locations to make the application easier to code and have less defects in the code.

* AlamoFire
  + Elegant HTTP Networking in Swift
  + https://github.com/Alamofire/Alamofire
  + https://github.com/Alamofire/Alamofire/blob/master/Documentation/Usage.md#introduction


### Samples Git Hub Projects Used:

Here's a list of sample project that I used to help build this sample application.

* https://github.com/awslabs/aws-sdk-ios-samples/tree/master/IoT-Sample/Swift

Sample package manager upcoming for XCode and Swift, that may be a better long term replacement to CocoaPods

* https://developer.apple.com/documentation/xcode/creating_a_swift_package_with_xcode

A good article announcing Apple's Swift programming language is now open source

* https://www.theverge.com/2015/12/3/9842854/apple-swift-open-source-released


### Some Open Source Data Providers

Here's a collection of researched URLs that I was researching to pull data for the project.

* https://github.com/public-apis/public-apis
* https://www.metaweather.com/api/
* https://github.com/jamesseanwright/ron-swanson-quotes#ron-swanson-quotes-api
* http://ron-swanson-quotes.herokuapp.com/v2/quotes/15
* https://apilist.fun/collection/free-apis
* https://any-api.com/



