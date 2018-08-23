# == Schema Information
#
# Table name: etfs
#
#  id                 :integer          not null, primary key
#  ticker             :string
#  name               :string
#  user_id            :integer
#  rating             :string
#  fee                :float
#  similarity_ranking :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  category           :string
#  provider           :string
#

class Etf < ApplicationRecord
  validates :ticker, :presence => true
  validates :name, :presence => true
  
  has_many :holdings, :dependent => :destroy, :foreign_key => "fund_id"
  has_many :owners, :through => :holdings, :source => :user
  
  # has_many :similarities_as_primary, :foreign_key => "primary_fund", :class_name => "Similarity"
  
  def best_match
    matching_similarities = Similarity.where(:primary_fund => self.ticker)
    
    best_similarity = matching_similarities.order(:ranking).first
    
    best_etf = Etf.find_by({ :ticker => best_similarity.foreign_fund })
    
    return best_etf
  
  end

  def second_best_match
    matching_similarities = Similarity.where(:primary_fund => self.ticker)
    
    second_best_similarity = matching_similarities.order(:ranking).second
    
    second_best_etf = Etf.find_by({ :ticker => second_best_similarity.foreign_fund })
    
    return second_best_etf
    
  end
end
