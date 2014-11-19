# Crash in iOS7 w/iOS8 SDK

Steps to reproduce

1. Install Xcode 6.01
2. Install the iOS 7 emulator in Xcode 6.01. ([Xcode -> Preferences -> Downloads](http://www.evernote.com/shard/s330/sh/df79bc3b-418f-447d-9716-4be82ab418c0/66f39c42084d0ae6303d4603a2bb856d/deep/0/Downloads.png))
3. Pull down this code: `git clone git@github.com:jayroh/sample-cdq.git && cd sample-cdq && bundle`
4. Run the app using a 7.x emulator: `bundle exec rake target=7.1 device_name='iPhone 5s'`

The app will start up in the iPhone 5S / iOS 7.1 emulator and give you the repl.

To trigger the crash, run the following in the repl:

```ruby
p = Post.new and p.active = 1
```

Boom. Crashlog can be found [here](https://raw.githubusercontent.com/jayroh/sample-cdq/master/sample-cdq_2014-09-22-202241_jro.crash)

* * *

The part of the code that causes this, just by its being defined, is in the Post model

`app/models/post.rb`

```ruby
  def activate
    self.active = 1
    cdq.save
  end
```

Commenting the contents of that method allows things to not crash.

* * *

Output when I run the rake build command:

```sh
➜  sample-cdq git:(master) ✗ be rake target=7.1 device_name='iPhone 5s'
Generating Data Model sample-cdq
   Loading schemas/0001_initial.rb
   Writing resources/sample-cdq.xcdatamodeld/0001 initial.xcdatamodel/contents
     Build ./build/iPhoneSimulator-7.0-Development
     Build /Users/joel/.rbenv/versions/2.1.4/lib/ruby/gems/2.1.0/gems/motion-yaml-1.2.1/lib/YAMLKit
     Build /Users/joel/.rbenv/versions/2.1.4/lib/ruby/gems/2.1.0/gems/cdq-0.1.10/lib/../vendor/cdq/ext
      Link ./build/iPhoneSimulator-7.0-Development/sample-cdq.app/sample-cdq
   Compile ./resources/sample-cdq.xcdatamodeld
2014-11-19 10:56:45.301 momc[8929:d07] [MT] DVTSDK: Warning: SDK path collision for path '<DVTFilePath:0x7fa1d2446370:'/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator8.1.sdk'>': SDK with name 'iphonesimulator8.1' being superceded by SDK with 'iphonesimulator8.1'.
    Create ./build/iPhoneSimulator-7.0-Development/sample-cdq.app/Info.plist
2014-11-19 10:56:45.426 xcodebuild[8936:d07] [MT] DVTSDK: Warning: SDK path collision for path '<DVTFilePath:0x7ffd2a63ba90:'/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator8.1.sdk'>': SDK with name 'iphonesimulator8.1' being superceded by SDK with 'iphonesimulator8.1'.
      Copy ./resources/sample-cdq.momd
      Copy ./resources/sample-cdq.momd/0001 initial.mom
      Copy ./resources/sample-cdq.momd/0001 initial.omo
      Copy ./resources/sample-cdq.momd/VersionInfo.plist
    Create ./build/iPhoneSimulator-7.0-Development/sample-cdq.app.dSYM
  Simulate ./build/iPhoneSimulator-7.0-Development/sample-cdq.app
2014-11-19 10:56:45.800 sim[8945:d07] [MT] DVTSDK: Warning: SDK path collision for path '<DVTFilePath:0x10012ba70:'/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator8.1.sdk'>': SDK with name 'iphonesimulator8.1' being superceded by SDK with 'iphonesimulator8.1'.
```
