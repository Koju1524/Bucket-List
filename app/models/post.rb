# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  video      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Post < ApplicationRecord
  mount_uploader :video, VideoUploader
end
