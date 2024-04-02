class Director < ApplicationRecord
  belongs_to :favorite_genre, class_name: 'Genre'

  validates :name, length:{minimum: 3, maximum: 50, message: "O nome deve conter entre 3 e 50 caracteres"}
  validates :nationality, length:{minimum: 3, maximum: 50, message: "A nacionalidade deve conter entre 3 e 50 caracteres"}
  validate :future_birth_date

  private

  def future_birth_date
    if self.birth_date.present?
      errors.add(:base, "O nascimento deve ocorrer antes do ano atual.") unless self.birth_date.year < Date.today.year
    end
  end
end
