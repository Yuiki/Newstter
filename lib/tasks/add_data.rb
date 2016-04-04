require 'twitter'
require 'searchbing'
require "#{Rails.root}/app/models/trend_news"

class Tasks::AddData
  @@bing = Bing.new(Constants::BING_API_KEY, 1, 'News')

  @@twitter = Twitter::REST::Client.new do |config|
    config.consumer_key        = Constants::TWITTER_CONSUMER_KEY
    config.consumer_secret     = Constants::TWITTER_CONSUMER_KEY_SECRET
    config.access_token        = Constants::TWITTER_ACCESS_TOKEN
    config.access_token_secret = Constants::TWITTER_ACCESS_TOKEN_SECRET
  end

  def self.execute
    Rails.logger.debug("ADD DATA EXECUTE")
    trends_news = get
    time = Time.zone.now
    trends_news.each do |trend_news|
        TrendNews.create(Title: trend_news[:Title],
                         Url:   trend_news[:Url],
                         Source: trend_news[:Source],
                         Description: trend_news[:Description],
                         Name: trend_news[:Name],
                         Date: trend_news[:Date],
                         Time: time)
    end
  end

  def self.get
    trends_news = []
    getTrends.each do |trend|
      result = search(trend)
      if result.present? then
        trend_news = { Title: result[:Title],
                       Url: result[:Url],
                       Source: result[:Source],
                       Description: result[:Description],
                       Date: result[:Date],
                       Name: trend }
        trends_news.push trend_news
      end
    end
    trends_news
  end

  private

    def self.getTrends
      @@twitter.local_trends(23424856).map { |i| i.to_hash[:name] }
    end

    def self.search(query)
      results = @@bing.search(query)
      results[0][:News][0]
    end
end