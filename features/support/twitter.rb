module TwitterRakeHelpers
  def invoke_twitter_rake(task_name)
    case task_name
    when 'post_random_tweets'
      RandomTweeter.new.post_tweets
    else
      raise "don't know how to run task: #{task_name}"
    end
  end
end

World(TwitterRakeHelpers)
