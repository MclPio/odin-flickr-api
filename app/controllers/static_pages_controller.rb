class StaticPagesController < ApplicationController
  def index
    flickr_api_key = Figaro.env.flickr_api_key
    flickr_shared_secret = Figaro.env.flickr_shared_secret
    flickr = Flickr.new(flickr_api_key, flickr_shared_secret)

    begin
      if params[:commit] == "Submit"
        user_id = flickr_params
        @user_photos = flickr.photos.search(user_id: user_id, format: 'json')
      end
    rescue Flickr::FailedResponse
      flash[:alert] = "ID is invalid"
      @user_photos = []
    end
  end

  private

  def flickr_params
    params.permit(:id)[:id] || ""
  end
end
