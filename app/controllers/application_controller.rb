# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include SessionsHelper

  private

  def require_user_logged_in
    redirect_to new_session_url unless logged_in?
  end

  def counts(user)
    @count_questions = user.questions.count
    @count_followings = user.followings.count
    @count_followers = user.followers.count
    @count_likes = user.likes.count
  end
end
