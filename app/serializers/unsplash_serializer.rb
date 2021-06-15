class UnsplashSerializer
  include JSONAPI::Serializer
  attributes :image_url, :photographer, :photographer_url, :unsplash, :unsplash_url
end
