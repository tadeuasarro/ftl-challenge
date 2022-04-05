module Appointments
  class Create
    def initialize(params:)
      @params = params
      @people = params[:people].to_i
    end

    def call
      { json: result, status: :ok }
    rescue StandardError => e
      { json: e, status: :bad_request }
    end

    private

    attr_reader :params, :people

    def result
      Appointment.where("people in (#{range.join(', ')})")
    end

    def range
      return range_1 if range_1.include?(people)

      return range_2 if range_2.include?(people)

      return range_3 if range_3.include?(people)

      raise 'Invalid amount of people'
    end

    def range_1
      (1..2).to_a
    end

    def range_2
      (3..4).to_a
    end

    def range_3
      (5..8).to_a
    end
  end
end
