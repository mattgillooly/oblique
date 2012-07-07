require "rake"

module TwitterRakeHelpers
  def invoke_twitter_rake(task_name)
    load File.join(Rails.root, 'lib', 'tasks', 'twitter.rake')
    Rake::Task.define_task(:environment)
    Rake::Task[task_name].invoke
  end
end

World(TwitterRakeHelpers)
