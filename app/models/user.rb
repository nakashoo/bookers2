class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :book, dependent: :destroy

    has_one_attached :profile_image
    validates :introduction, presence: true

  def get_profile_image
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/default-image.jpeg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpeg', content_type: 'image/jpeg')
    end
    profile_image
  end

end

# <% @users.each do |user| %>
#             <tr>
#               <td><%= image_tag user.get_profile_image, size: "75x75" %></td>
#               <td><%= user.name %></td>
#               <td><%= link_to "Show", user_path(user.id) %></td>
#             </tr>
#           <% end %>
