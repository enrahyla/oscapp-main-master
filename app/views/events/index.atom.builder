atom_feed do |feed|
  feed.title("The latest events")
  
  @events.each do |event|
    feed.entry(event) do |entry|
    
      entry.title(event.title)
      entry.content(event.body, :type => 'html')
      entry.author do |author|
        author.name "Adam Hyland"
       # author.name event.author.username
      end
     end
  end
end