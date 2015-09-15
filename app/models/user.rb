# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  username   :string           not null
#

class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true

  has_many :contacts, dependent: :destroy
  has_many :contact_shares, dependent: :destroy
  has_many :shared_contacts, through: :contact_shares, source: :contact
  has_many :comments, :as => :commentable
  has_many :authored_comments, through: :contacts, source: :authored_comments



  def favorites
    Contact.find_by_sql(<<-SQL)
      SELECT
        contacts.*
      FROM
        contacts
      INNER JOIN
        contact_shares ON contacts.id = contact_shares.contact_id
      INNER JOIN
        users ON users.id = contact_shares.user_id
      JOIN
        contacts my_own ON my_own.user_id = users.id
      WHERE
        (contact_shares.favorite = true
        OR
        my_own.favorite = true)
        AND
        users.id = #{self.id}
    SQL
  end
end
