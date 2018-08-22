# == Schema Information
#
# Table name: similarities
#
#  id           :integer          not null, primary key
#  primary_fund :integer
#  foreign_fund :integer
#  ranking      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Similarity < ApplicationRecord
    belongs_to :etf
end
