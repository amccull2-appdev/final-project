namespace :slurp do
  desc "TODO"
  task etfs: :environment do
    require "csv"
    
    Etf.destroy_all
    csv_text = File.read(Rails.root.join("lib", "csvs", "etf_data.csv"))
    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
    csv.each do |row|
      e = Etf.new
      e.name = row["name"]
      e.ticker = row["ticker"]
      e.category = row["category"]
      e.rating = row["rating"]
      e.fee = row["fee"]
      e.provider = row["provider"]
      e.save
      puts "#{e.errors.full_messages}, saved"
    end
  puts "There are now #{Etf.count} rows in the Etfs table"
  end
end
