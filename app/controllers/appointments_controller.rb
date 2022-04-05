class AppointmentsController < ApplicationController
  def create
    render Appointments::Create.new(params: create_params).call
  end

  private

  def create_params
    params.permit(:people, :schedule)
  end
end
