csv_str = CSV.generate do |csv|
  csv << @results.attribute_names
    @results.all.each do |result|
    csv << result.attributes.values_at(*@results.attribute_names)
  end
end