xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Diary Entries"
    xml.description "All of the important dates for the diary"
    xml.link diaries_url(format: :rss)
    
    for article in @diaries
      xml.item do
        xml.title article.name
        xml.description article.content
        xml.pubDate article.created_at.to_s(:rfc822)
      end
    end
  end
end