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
end
