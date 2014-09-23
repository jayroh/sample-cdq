class AppDelegate
  include CDQ

  def application(application, didFinishLaunchingWithOptions:launchOptions)
    cdq.setup

    post = Post.new
    post.active = 1

    true
  end
end
