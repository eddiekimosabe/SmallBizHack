class FlagsController < ApplicationController
	def create
		@flag = Flag.new(flag_params)
		@flag.save
		render json: @flag.to_json
	end

	private

	def flag_params
		params.require(:flag).permit(:flagger_id, :flagged_id, :flagged_invoice_id)
	end
end