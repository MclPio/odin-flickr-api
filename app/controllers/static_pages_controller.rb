class StaticPagesController < ApplicationController
  def index
    flickr_api_key = Figaro.env.flickr_api_key
    flickr_shared_secret = Figaro.env.flickr_shared_secret
    flickr = Flickr.new(flickr_api_key, flickr_shared_secret)
    @user_photos = flickr.photos.search(user_id: flickr_params, format: 'json')
    # @user_photos is accessable through parameters. ex: user_photos.each { |photo| puts photo.id}
  end

  private

  def flickr_params
    params.require(:id)
  end
end
