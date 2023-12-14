class StaticPagesController < ApplicationController
  def index
    @user_photos = nil
    flickr_api_key = Figaro.env.flickr_api_key
    flickr_shared_secret = Figaro.env.flickr_shared_secret
    flickr = Flickr.new(flickr_api_key, flickr_shared_secret)
    if !params[:id].nil?
      @user_photos = flickr.photos.search(user_id: flickr_params, format: 'json')
    end
  end

  private

  def flickr_params
    params.require(:id)
  end
end
