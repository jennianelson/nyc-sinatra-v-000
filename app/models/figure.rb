class Figure < ActiveRecord::Base
  has_many :landmarks
  has_many :figure_titles
  has_many :titles, through: :figure_titles

  def slug
    name.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    self.all.detect {|s| slug == s.slug}
  end
end
