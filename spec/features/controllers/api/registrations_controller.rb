class Api::RegistrationsController < Api::BaseController
  before_action :set_event

def create
  total_price = get_total_price(registration_params)
  registration = @event.registrations.new(registration_params.merge(total: total_price))

  if registration.save
    render status: 200, json: {
      message: "registration successfully created",
      event: @event,
      registration: registration
    }.to_json
  else
    render status: 422, json: {
      message: "registration could not be created",
      errors: registration.errors
    }.to_json
  end
end


def update
    total_price = get_total_price(registration_params)
    registration = @event.registrations.find(params[:id])

    if registration.update(registration_params.merge(total: total_price))
      render status: 200, json: {
        message: "Registration successfully updated",
        event: @event,
        registration: registration
      }.to_json
    else
      render status: 422, json: {
        message: "Registration could not be updated",
        errors: registration.errors
      }.to_json
    end
  end

  def destroy
    registration = @event.registrations.find(params[:id])
    registration.destroy

    render status: 200, json:{
      message: "Registration  '#{@event.name}'' destroyed",
      event: @event,
      registration: registration
    }.to_json
  end


private

def set_event
  @event = Event.find(params[:event_id])
end

def get_total_price(registration_params)
  total_price = (registration_params[:guest_count] * registration_params[:price])
  return total_price
end

def registration_params
  params.require(:registration).permit(:starts_at, :ends_at, :price, :total, :guest_count, :event_id)
end

end
