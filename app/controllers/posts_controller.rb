class PostsController < ApplicationController

  def index
    isaiah = Octokit::Client.new(access_token: ENV["github_key"])
    @indy_ruby_basic_users = isaiah.search_users("language:ruby location:indianapolis", page: params[:page], sort: 'joined', order: 'asc')
    @pages = (@indy_ruby_basic_users[:total_count]/30.0).ceil
    @indy_ruby_advanced_users = @indy_ruby_basic_users[:items].map{ |this_user| Octokit.user(this_user.login) }
    @indy_ruby_users_recent_repos = @indy_ruby_basic_users[:items].map {}
  end

  def recent_activity
    @recent_activities = Octokit.user_events(params[:user], sort:'created_at')
  end

  def repositories
    repositories_search = Octokit.search_repos("user:#{params[:user]}", sort:'stars', per_page: 5.0, page: params[:page])
    @pages = (repositories_search[:total_count]/5.0).ceil
    @repositories = repositories_search[:items]
  end

end
