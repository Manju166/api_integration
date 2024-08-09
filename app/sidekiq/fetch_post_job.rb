class FetchPostJob
  include Sidekiq::Job

  def perform(title,body)
    puts "hello"

    Blog.create(title:title, body:body)
  end
end
