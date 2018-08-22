# == Schema Information
#
# Table name: holdings
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  fund_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Holding < ApplicationRecord
  # validates :user_id, :presence => true
  # validates :fund_id, :presence => true
  validates :fund_id, :uniqueness => { :scope => [:user_id], :message => "You already own this fund" }
  
  belongs_to :user
  belongs_to :etf
end
