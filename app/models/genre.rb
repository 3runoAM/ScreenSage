class Genre < ApplicationRecord
  has_many :movies
  validates :name, uniqueness: {message: "Já existe um gênero com esse nome" },
            length: {minimum: 3, maximum: 20, message: "No mínimo 3 caracteres, no máximo 20"}
end
