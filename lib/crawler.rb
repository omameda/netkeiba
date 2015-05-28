# encoding: utf-8
# URLにアクセスするためのライブラリの読み込み
require 'open-uri'
# Nokogiriライブラリの読み込み
require 'nokogiri'
require 'kconv'

class Crawler

  def initialize
    
  end

  def start(url)
    # スクレイピング先のURL
    @url = url #'http://db.netkeiba.com/horse/2011104201/'
    @horseId = url.split("/").last
    # 文字コードがiso-8859-1になってだめだった
    # charset = nil
    # html = open(url) do |f|
    #   charset = f.charset # 文字種別を取得
    #   f.read # htmlを読み込んで変数htmlに渡す
    # end
    # p charset
    # # htmlをパース(解析)してオブジェクトを作成
    # @doc = Nokogiri::HTML.parse(html, nil, charset)

    html = open(url).read
    @doc = Nokogiri::HTML(html.toutf8, nil, 'utf-8')
  

    # getHorseProfile
    # getRaceResult
    
  end

  def getRaceResults
    results = []
    @doc.css('.db_h_race_results').css('tr').each do |node|
      row = node.css("td").to_enum
      loop do
        result = {}
        result[:date] = row.next.text
        result[:location] = row.next.text
        result[:weather] = row.next.text
        result[:lane] = row.next.text
        result[:meeting] = getId(row.next)
        row.next
        result[:accommodation] = row.next.text
        result[:waku] = row.next.text
        result[:baban] = row.next.text
        result[:odds] = row.next.text
        result[:popularity] = row.next.text
        result[:order] = row.next.text
        result[:jockey] = getId(row.next)
        result[:kinweight] = row.next.text
        result[:distance] = row.next.text
        result[:condition] = row.next.text
        row.next
        result[:time] = row.next.text
        result[:differrnce] = row.next.text
        row.next
        row.next
        row.next
        row.next
        result[:weight] = row.next.text
        row.next
        row.next
        row.next
        result[:prize] = row.next.text

        results.push result          
      end
    end
    results
  end

  def getHorseProfile
    result = {}
    row = @doc.css('.db_prof_table').css('td').to_enum
      loop do
        result[:birth] = row.next.text
        result[:trainer] = getId(row.next)
        result[:owner] = getId(row.next)
        result[:breeder] = getId(row.next)
        result[:location] = row.next.text
        row.next
        result[:centerprize] = row.next.text
        result[:localprize] = row.next.text
        result[:result] = row.next.text
        row.next

        inbread = row.next.css('a')
        result[:inbreadfather] = getId(inbread.first)
        result[:inbreadmother] = getId(inbread.last)
      end
    
    row = @doc.css('.blood_table').css('td').to_enum
    loop do
      result[:father] = getId(row.next)
      result[:paternal_grandfather] = getId(row.next)
      result[:paternal_grandmother] = getId(row.next)
      result[:mother] = getId(row.next)
      result[:maternal_grandfather] = getId(row.next)
      result[:maternal_grandmother] = getId(row.next)
    end  
    @horseName = horseName @doc.title
    result[:name] = @horseName
    result[:horse_id] = @horseId
    
    result

  end

  def getURLs
    
  end

  def validURL?
    
  end

  def horseName(html)
    s = html.split('｜')
    s.first
  end

  def getId(node)
    begin
      link = node.css('a').attribute('href').value
      s = link.split("/")
      s.last
    rescue Exception => e
      p e.class 
      p "error: getId"
    end
  end

end
# testcode
# craw = Crawler.new()
# pro = craw.start("http://db.netkeiba.com/horse/2011104201/")
# p craw.getHorseProfile
# p craw.getRaceResults

# doc.css('.db_prof_table').each do |node|
#   p node.text

# end