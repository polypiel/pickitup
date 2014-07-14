class PickupsController < ApplicationController
	def index
		@pickups = Pickup.all
	end

	def show
    @pickup = Pickup.find(params[:id])
  end

	def new
		@pickup = Pickup.new
	end

	def edit
	  @pickup = Pickup.find(params[:id])
	end

	def create
	  @pickup = Pickup.new(pickup_params)
	 
	  if @pickup.save
	  	redirect_to @pickup
	  else
	  	render 'new'
	  end
	end

	def update
	  @pickup = Pickup.find(params[:id])
	 
	  if @pickup.update(pickup_params)
	    redirect_to @pickup
	  else
	    render 'edit'
	  end
	end

	def destroy
	  @pickup = Pickup.find(params[:id])
	  @pickup.destroy
	 
	  redirect_to pickups_path
	end

	private
		def pickup_params
			params.require(:pickup).permit(:datetime, :comments)
		end
end
