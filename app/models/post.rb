class Post < ApplicationRecord
	
	validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: { in: ['Fiction', 'Non-Fiction'] }
	validate :clickbait?

	PATTERNS = [/Won't Believe/i]

	def clickbait?
	if PATTERNS.none?{|pattern| pattern.match title}
	errors.add(:title, "is clickbait")
	end
	end	
end
