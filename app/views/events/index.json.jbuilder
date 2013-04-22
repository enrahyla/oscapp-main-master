json.channel do

for events in @events
      json.item
        json.title events.title
        json.description events.body
        json.pubDate events.created_at.to_s(:rfc822)
      end
    end
