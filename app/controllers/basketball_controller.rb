class BasketballController < ApplicationController
	# index, show, new and edit have views
	# create, update and destroy only perform processing
	
	# Trigger only in create and update methods?
	before_filter :check_for_cancel, :only => [:create, :update]
	def check_for_cancel
		# if value == Cancel, redirect to index
		if params[:commit] == "Cancel"
			redirect_to basketball_index_path
		end
	end
	
	# Can't declare private, new.html.erb uses this parameter
	def basketball_params
		params.require(:basketball).permit(:date, :time, :team1, :team2, :location, :status, :winner, :score)
	end
	
	def index
		# create an instance variable
		# Store all of the basketball results inside the variable
		@basketballs = Basketball.all
	end
	
	# Display a form to create a new basketball
	def new
		# empty basketball object
		@basketball = Basketball.new
	end
	
	# Form from the new action will submit and save to DB
	def create
		# declare new variable basketball obj to store result
		# Grab form information through params :basketball
		#@basketball = Basketball.new(params[:basketball])
		@basketball = Basketball.new(basketball_params)
		
		# Save the basketball obj to DB
		# @basketball.save will return true or false, so we evaluate it
		if @basketball.save
			# Redirect to index, create a flash message to display in index
			redirect_to basketball_index_path, :notice => "Success! Event was saved"
		else
			# if not able to save Basketball
			# Render the new page
			render "new"
		end
	end
	
	# Display a form for editing a basketball
	def edit
	
	end
	
	# Updating a basketball, form on the edit page will submit to update action which will update it in DB
	def update
	
	end
	
	# Delete a post
	def destroy
	
	end
end
