class SurLaTableCookingClasses::CLI

  def call
    list_classes
    display_menu
  end

  def list_classes
    puts "***************** Sur La Table **********************"
    puts "******* Customer Favorite Cooking Classes ***********"
    puts ""
    SurLaTableCookingClasses::CookingClasses.all.each_with_index {|theClass, i| puts "[#{i+1}] #{theClass.name}"}
  end


  def display_menu
    input = nil
    while input != "exit"
      puts "Type the [class number] which  you\'d like more details, or  [list] to see the list again or [exit] to exit. Then press enter"
      input = gets.strip.downcase
      if input == "list"
        list_classes
      elsif input == "exit"
        puts "goodbye!"
      elsif input.to_i.between?(1, SurLaTableCookingClasses::CookingClasses.all.size)
        display_class_details(input.to_i)
      else
        puts "This is not a valid input. Please try again."
      end
    end
  end

  def display_class_details(i)
    the_class = SurLaTableCookingClasses::CookingClasses.all[i-1]
    puts "******* #{i}. #{the_class.name} ************"
    puts "Description:"
    puts the_class.desc
    puts ""
    puts "Menu"
    puts the_class.menu
    puts ""
  end

end
