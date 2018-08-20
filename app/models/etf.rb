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
#

class Etf < ApplicationRecord
  validates :user_id, :presence => true
  validates :name, :presence => true  
  
  has_many :holdings, :dependent => :destroy
  has_many :owners
end
