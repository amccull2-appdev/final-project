namespace :slurp do
  desc "TODO"
  task etfs: :environment do
    require "csv"
    
    csv_text = File.read(Rails.root.join("lib", "csvs", "etf_data.csv"))
    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
    csv.each do |row|
      t = Etf.new
      t.name = row["Name"]
      t.ticker = row["Ticker"]
      t.category = row["Category"]
      t.rating = row["Rating"]
      t.fee = row["Fee"]
      t.save
      puts "#{t.ticker}, saved"
    end
  puts "There are now #{Etf.count} rows in the Etfs table"
  end
end
