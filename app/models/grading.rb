class Grading < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :teacher_id, :presence => true

  # Scopes

  def to_s
    teacher.to_s
  end

end
