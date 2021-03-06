class PostTweets

  class_attribute :delivery_method

  @@deliveries = []

  def post(user, text)
    if delivery_method == :test
      @@deliveries << [user, text]
    else
      user.twitter.update(text)
    end
  end

  def self.deliveries
    @@deliveries
  end

end
