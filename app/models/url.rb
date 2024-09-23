class Url < ApplicationRecord
  before_create :generate_short_id
  validates :website, presence: true, format: URI::regexp(%w[http https])
  validates :short_id, uniqueness: true
  
  def generate_short_id
    self.short_id = SecureRandom.uuid[0..5] if short_id 
  end
end