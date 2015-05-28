csv_str = CSV.generate do |csv|
  csv << @horses.attribute_names
    @horses.all.each do |horse|
    csv << horse.attributes.values_at(*@horses.attribute_names)
  end
end