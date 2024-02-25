class Post < ApplicationRecord
  validates :title, presence: true, length: { minimum: 3 }
  validate :body_or_link

  belongs_to :user

  private
  def body_or_link
    if body.blank? && link.blank?
      errors.add(:base, "Body or link must be present")
    end
  end
end
