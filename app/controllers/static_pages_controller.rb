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
  #Issues
  #1. Form can not handle id of 0 'flickr.photos.search' - Parameterless searches have been disabled. Please use flickr.photos.getRecent instead.
  #2. Wrong IDS result in errors 'flickr.photos.search' - Unknown user
  #3. flickr_params breaks if blank id is submitted. param is missing or the value is empty: id
  private

  def flickr_params
    params.require(:id)
  end
end
