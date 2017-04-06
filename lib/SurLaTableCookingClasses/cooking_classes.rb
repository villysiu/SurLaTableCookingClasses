class SurLaTableCookingClasses:CookingClasses
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

  def self.all
    @@all.empty? ? scrape_cooking_classes || @@all
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

  def desc
    if @desc.nil?
      class_detail = Nokogiri::HTML(open(@@base_url + "#{self.url}"))
      @desc = class_detail.css("div.boxsides").children[6].text
    else
      @desc
    end
  end

  def menu
    if @menu.nil?
      class_detail = Nokogiri::HTML(open(@@base_url + "#{self.url}"))
      @menu = class_detail.css("div.boxsides").children[2].text
    else
      @menu
    end
  end

end
