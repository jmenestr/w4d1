# == Schema Information
#
# Table name: comments
#
#  id               :integer          not null, primary key
#  commentable_id   :integer          not null
#  comment          :text             not null
#  commentable_type :string           not null
#  created_at       :datetime
#  updated_at       :datetime
#  author_id        :integer
#

class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true
  belongs_to :author,
    class_name: "Contact",
    foreign_key: :author_id,
    primary_key: :id
end
