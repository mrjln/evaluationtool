class RegistrationsController < ApplicationController
  before_action :authenticate_user!

  def create
      total_price = get_total_price(registration_params)
      @registration = current_user.registrations.create(registration_params)
      redirect_to @registration.event, notice: "Thank you for registration! total price is #{total_price}"
    end

    private

    def get_total_price(registration_params)
      total_price = (registration_params[:guest_count] * registration_params[:price])
      return total_price
    end

    def registration_params
      params.require(:registration).permit(:price, :total, :guest_count)

    end

end
