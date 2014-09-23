class Post < CDQManagedObject
  def hi
    puts 'hi'
  end

  def activate
    self.active = 1
    cdq.save
  end
end
