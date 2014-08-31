class Book < ActiveRecord::Base
  belongs_to :user
  has_many :articles

  validates :title, presence: true

  def delete
    articles.each &:destroy
    destroy
  end
end
