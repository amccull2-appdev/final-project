namespace :slurpy do
  desc "TODO"
  task similarity: :environment do
    require "csv"
    
    Similarity.destroy_all
    csv_text = File.read(Rails.root.join("lib", "csvs", "similarity_scores.csv"))
    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1", col_sep: "\t")
    csv.each do |row|
      s = Similarity.new
      s.primary_fund = row["primary_fund"]
      s.foreign_fund = row["foreign_fund"]
      s.ranking = row["ranking"]
      s.save
      # puts "#{s.errors.full_messages}, saved"
      ap row
    end
  puts "There are now #{Similarity.count} rows in the Similarities table"
  end
end
