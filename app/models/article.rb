class Article < ActiveRecord::Base
  belongs_to :book

  validates :title, presence: true
  validates :content, presence: true
end
