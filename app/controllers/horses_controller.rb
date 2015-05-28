class HorsesController < ApplicationController
  before_action :set_horse, only: [:show, :destory]
  def index
    @horses = Horse.all
  end

  def show
    @results = @horse.race_results
    # うまくいかねw
    # respond_to do |format|
    #   format.html {}
    #   format.csv { render "horses/show.csv",location: [@results, @horse]}
    # end
  end

  def create
    crawler = Crawler.new()
    crawler.start(url_params[:url])
    @horse = Horse.create(crawler.getHorseProfile)
    crawler.getRaceResults.each do |result|
      @horse.race_results.create(result)
    end
    render action: 'show', status: :created, location: @horse
  end

  def destroy
    @horse.destroy
    redirect_to horses_url
    
  end

  private
    def url_params
      params.require(:post).permit(:url)
    end
    def set_horse
      @horse = Horse.find(params[:id])
    end
end
