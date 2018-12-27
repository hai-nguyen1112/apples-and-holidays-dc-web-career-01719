require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array
  holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
  holiday_hash[:winter][:christmas] << supply
  holiday_hash[:winter][:new_years] << supply

end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash[:spring][:memorial_day] << supply

end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
  holiday_hash[season] = {holiday_name => supply_array}

end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  winter_supplies = Array.new
  holiday_hash[:winter].each do |holiday, supplies|
    if winter_supplies == 0
      winter_supplies = supplies
    else
      i = 0
      while i < supplies.size
        winter_supplies << supplies[i]
        i += 1
      end
    end
  end
  winter_supplies
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
  holiday_hash.each do |season, holidays|
    puts season.to_s.capitalize + ":"
    holidays.each do |holiday, supplies|
      holiday = holiday.to_s
      if holiday == "christmas" || holiday == "thanksgiving"
        holiday.capitalize!
      else
        holiday = holiday.split("_")
        i = 0
        while i < holiday.size
          holiday[i].capitalize!
          i += 1
        end
        holiday = holiday.join(" ")
      end
      j = 0
      holiday = holiday + ": "
      while j < supplies.size
        if j< supplies.size - 1
        holiday = holiday + supplies[j] + ", "
        j += 1
        else
        holiday = holiday + supplies[j]
        j += 1
        end
      end
      puts "  " + holiday
    end
  end
end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  holidays_with_bbq = Array.new
  holiday_hash.each do |season, holidays|
    holidays.each do |holiday, supplies|
      i = 0
      while i < supplies.size
        if supplies[i] == "BBQ"
          holidays_with_bbq << holiday
        end
        i += 1
      end
    end
  end
  holidays_with_bbq
end
