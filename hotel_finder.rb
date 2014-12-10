class HotelFinder
  attr_reader :hotel_list
  HOTELS = "./Hotel.csv"

  def initialize
    @hotel_list = Array.new(collect_csv_data)
  end

  def main
    display_list
    search_hotels(users_query)
  end

  def collect_csv_data
    CSV.foreach(HOTELS, headers: true).map do |row|
      Hotel.new(row)
    end
  end

  def display_list
    hotel_list.each do |hotel|
      puts hotel.name
    end
  end

  def search_hotels(request)
    search_result = hotel_list.find {|item| item.name.downcase == request} || NullObject.new
    puts search_result.information
  end

  def users_query
    print "What Hotel are you looking for? >"
    gets.chomp.downcase
  end

end
