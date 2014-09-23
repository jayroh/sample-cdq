# Crash in iOS7 w/iOS8 SDK

Steps to reproduce

1. Install Xcode 6.01
2. Install the iOS 7 emulator in Xcode 6.01. ([Xcode -> Preferences -> Downloads](http://www.evernote.com/shard/s330/sh/df79bc3b-418f-447d-9716-4be82ab418c0/66f39c42084d0ae6303d4603a2bb856d/deep/0/Downloads.png))
3. Pull down this code: `git clone git@github.com:jayroh/sample-cdq.git && cd sample-cdq && bundle`
4. Run the app using a 7.x emulator: `rake target=7.1`

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
