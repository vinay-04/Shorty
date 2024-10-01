class UrlsController < ApplicationController
  def new
    @url = Url.new
  end

  def create
    website = url_params[:website]
    short_id = url_params[:short_id]
    unless website[/\Ahttp(s)?:\/\//]
      website = "http://#{website}"
    end
    @url = Url.new(url_params.merge(website: website, visit: 0))
    if website.blank? || short_id.blank?
      flash[:alert] = "Please fill all the fields"
      redirect_to new_url_path and return
    elsif Url.exists?(short_id: short_id)
      flash[:alert] = "Short ID has already been taken"
      redirect_to new_url_path
    elsif @url.save
      @url.update(short_id: short_id)
      redirect_to url_path(@url.short_id), notice: "URL successfully shortened!"
    else
      flash[:alert] = "Error creating shortened URL"
      redirect_to new_url_path
    end
  end

  def show
    @url = Url.find_by!(short_id: params[:short_id])
  end

  def redirect_to_url
    @url = Url.find_by(short_id: params[:short_id])
    if @url
      @url.increment!(:visit)
      redirect_to @url.website, allow_other_host: true
    else
      render plain: "URL not found", status: :not_found
    end
  end

  private

  def url_params
    params.require(:url).permit(:website, :short_id)
  end
end