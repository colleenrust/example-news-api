class ArticlesController < ApplicationController
  def index
    web_response = HTTP.get("https://newsapi.org/v2/everything?domains=wsj.com&q#{params[:search]}&apiKey=#{Rails.application.credentials.news_api.api_key}").parse(:json)
    articles = web_response["articles"]
    # filtered_articles = []
    # articles.each do |article|
    #   if article["title"][0] == "R"
    #     filtered_articles << articles    
    #   end
    # end
    render json: web_response
  end
end
