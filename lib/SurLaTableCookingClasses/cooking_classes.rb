class SurLaTableCookingClasses::cooking_classes
  attr_accessor :name, :name, :desc, :menu
  @@all = []
  @@base_url = "http://www.surlatable.com/"

  def initialize(name = nil, url = nil, desc = nil, menu = nil)
    @name = name
    @url = url
    @desc = desc
    @menu = menu
    @@all << self
  end

  def self.scrape_cooking_classes
    doc = Nokogiri::HTML(open(@@base_url + "category/cat2211278/In+Store+Classes"))
    class_array = doc.css("div.boxsides").first
    class_array.css("div.product a").each do |theClass|
      a_class = self.new
      a_class.name = theClass.children[1]['alt'].sub!('Cooking Class: ', '')
      a_class.url = theClass['href']
    end
    @@all

  end



end
