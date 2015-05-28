class NetkeibaController < ApplicationController
  def index
    @horses = Horse.all
  end

  def predict
    @raseHorses
    @ranking =[]
  end

  private
    def horses_params
      params.require(:post).permit(horses: [])
    end

end
