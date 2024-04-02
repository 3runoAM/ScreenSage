class Movie < ApplicationRecord
  belongs_to :director
  belongs_to :genre
  has_one_attached :poster
  before_save :set_status
  enum :draft => {'Postado': 0, 'Rascunho': 1}
  enum :status => {'Lançado': true, 'Em breve': false}

  validate :poster_type
  validates :title, length: {minimum: 3, maximum: 50, message: "O título deve conter entre 3 e 50 caracteres."}
  validates :plot, length: {minimum: 3, maximum: 250, message: "A sinopse deve conter entre 3 e 250 caracteres."}
  validates :origin_country, length: {minimum: 3, maximum: 20, message: "O país de origem deve conter entre 3 e 20 caracteres."}
  validates :genre_id, presence: {message: "Um gênero deve ser escolhido"}
  validates :release_year, presence: {message: "Um ano de lançamento deve ser escolhido"}
  validates :director_id, presence: {message: "Um diretor deve ser escolhido"}

  private

  def poster_type
    if poster.attached?
      if poster.blob.content_type.start_with?('image/gif')
        errors.add(:base, "GIFs não são aceitos como poster.")
      end
    else
      self.poster.attach(io: File.open(
        Rails.root.join('app', 'assets', 'images', 'default_poster.png')), filename: 'default_poster.png', content_type: 'image/png')
    end
  end

  def released?
    release_year <= Date.today.year
  end

  def set_status
    self.status = released? ? true : false
  end
end