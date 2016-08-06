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
  holiday_hash.each do |season, holiday|
    if season == :winter
      holiday.each do |holiday, item|
        item.push(supply)
      end
    end
  end
end


def add_supply_to_memorial_day(holiday_hash, supply)
  holiday_hash.each do |season, holiday|
    if season == :spring
      holiday.each do |holiday, item|
        if holiday == :memorial_day
          item.push(supply)
        end
      end
    end
  end
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  holiday_hash.each do |cur_season, cur_holiday|
    if cur_season == season
      holiday_hash[cur_season][holiday_name] = supply_array
      return holiday_hash
    end
  end
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  all_winter_items = []
  holiday_hash.each do |season, holiday|
    if season == :winter
      holiday.each do |holiday, item_array|
          all_winter_items.push(item_array)
      end
    end
  end
  return all_winter_items.flatten!
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
  holiday_hash.each do |season, holiday|

    puts season.to_s.capitalize + ":"

    holiday.each do |indv_holiday, items|

      indv_holiday = indv_holiday.to_s.split("_")

      indv_holiday.each do |caps|
        caps.capitalize!
      end

      indv_holiday = indv_holiday.join(" ")

      items = items.join(", ")

      puts "  " + indv_holiday + ": " + items

      #items.each do |item|
      #  if items.index(item) < items.length - 1
      #    print item + ", "
      #  else
      #    puts item
      #  end
      #end
    end
  end
end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  array_of_bbq_sym = []
  holiday_hash.each do |season, holiday|
    holiday.each do |holiday_name, item_array|
      temp_holiday_name = holiday_name
      item_array.each do |item|
        if item == "BBQ"
          array_of_bbq_sym.push(temp_holiday_name)
        end
      end
    end
  end
  return array_of_bbq_sym
end
