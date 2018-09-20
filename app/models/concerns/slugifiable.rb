module Slug
  def slug
    slug = self.name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  end
end
