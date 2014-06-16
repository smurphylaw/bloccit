class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  validates :body, length: { minimum: 5 }, presence: true
  validates :user, presence: true
  
  after_create :send_favorite_emails

  private

  def self_favorite_emails
    self.post.favorites.each do |favorite|
      
      if favorite.user_id != self.user && favorite.user.email_favorites?
        FavoriteMailer.new_comment(favorite.user, self.post, self).deliver
      end
    end
  end
  
end
