class Music < ApplicationRecord
  has_many :user_musics, dependent: :nullify
  has_many :group_musics, dependent: :nullify
end
