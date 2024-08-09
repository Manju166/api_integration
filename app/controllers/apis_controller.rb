require 'json'
class ApisController < ApplicationController
  def index
    @response = ApiHandler.new.get_posts
    @posts = JSON.parse(@response.body);
    # puts @posts

    @posts.each do |post|
      FetchPostJob.perform_async(post['title'],post['body'])
    end

  end
end
