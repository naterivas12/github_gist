require 'httparty'

class DataController < ApplicationController
  before_action :set_datum, only: %i[ show edit update destroy ]

  # GET /data
  def index

    response = HTTParty.get 'https://api.stagingeb.com/v1/contact_requests', headers: {
      'Content-Type' => 'application/json',
      'X-Authorization' => 'l7u502p8v46ba3ppgvj5y2aad50lb9'
    }

    @data = JSON.parse(response.body)
    @data = @data["content"]

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_datum
      @datum = Datum.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def datum_params
      params.require(:datum).permit(:dataName)
    end
end
