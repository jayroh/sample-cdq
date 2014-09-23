class Post < CDQManagedObject
  def activate
    # commenting the following two lines will stop the crash

    self.active = 1
    cdq.save
  end
end
