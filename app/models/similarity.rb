# == Schema Information
#
# Table name: similarities
#
#  id           :integer          not null, primary key
#  primary_fund :string
#  foreign_fund :string
#  ranking      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Similarity < ApplicationRecord
    # belongs_to :etf
    
    validates :primary_fund, :presence => true
    validates :foreign_fund, :presence => true
end
