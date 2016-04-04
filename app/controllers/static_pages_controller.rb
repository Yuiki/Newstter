class StaticPagesController < ApplicationController
  def index
    last = TrendNews.last
    datetime = last[:Time]
    @trends_news = TrendNews.where(Time: datetime)
  end
end