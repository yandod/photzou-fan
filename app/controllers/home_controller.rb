class HomeController < ApplicationController
  layout nil
  def index
    require 'rss'
    require 'net/http'
    require 'uri'
    rss_source = Net::HTTP.get URI.parse('http://photozou.jp/feed/photo_pickup.xml')
    @rss = RSS::Parser.parse(rss_source, true)
    @rss.title << '(Large)'
    @rss.items.each {|item|
      item.description[/_thumbnail/] = ''
      item.description[/width="120" height="120"/] = ''
    }
  end

end
