class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :introduction, length: { maximum: 50 }
  validates :name, length: { maximum: 20 }

  has_many :books, dependent: :destroy

  has_one_attached :profile_image


  def get_profile_image
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/default-image.jpeg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpeg', content_type: 'image/jpeg')
    end
    profile_image
  end

  validate :custom_name_validation

  private

  def custom_name_validation
    if name.blank?
      errors.add(:name, "can't be blank")
    elsif name.length < 2
      errors.add(:name, "is too short (minimum is 2 characters)")
    end
  end

end