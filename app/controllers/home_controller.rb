class HomeController < ApplicationController
  def index
    @prompts = Prompt.limit(10).order('created_at DESC')
  end
end
