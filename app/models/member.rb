class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :validatable

  before_create :set_unique_identifiers

  protected

  def generate_username
    candidate = full_name.sub('.', ' ').gsub(/\s+/, '.').downcase
    return candidate unless Member.exists?(lab_username: candidate)

    counter = 2
    while Member.exists?(lab_username: "#{candidate}.#{counter}")
      counter += 1
    end

    "#{candidate}.#{counter}"
  end

  def set_unique_identifiers
    self.lab_username = generate_username unless lab_username
    self.uuid = SecureRandom.uuid
  end
end
