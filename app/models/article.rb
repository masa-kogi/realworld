class Article < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  before_save :generate_slug
  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :body, presence: true

  def to_param
    slug
  end

  def generate_slug
    self.slug = self.title.parameterize if title.present?
  end
end
