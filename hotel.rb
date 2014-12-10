class Hotel
attr_reader :name, :city, :phone, :single_beds, :double_beds

  def initialize(hotelinfo)
    @name = hotelinfo["Hotel"].strip
    @city = hotelinfo["City"].strip
    @phone = clean_phone(hotelinfo["Phone Number"])
    @single_beds = clean_number(hotelinfo["Number of Singles"])
    @double_beds = clean_number(hotelinfo["Number of Doubles"])
  end

  def information
    "City: " + city + " Phone: " + phone + " Total Beds: " + "#{total_beds}"
  end

  def clean_number(number)
    number.strip.gsub(/[^\d+]/,"").to_i
  end

  def total_beds
    single_beds + double_beds
  end

  def clean_phone(number)
    format_phone(number.strip.gsub(/[^\d+]/,""))
  end

  def format_phone(cleaned_number)
    "(#{cleaned_number[0..2]}) #{cleaned_number[3..5]}-#{cleaned_number[6..9]}"
  end
end
