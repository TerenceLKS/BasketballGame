class BasketballController < ApplicationController
	# index, show, new and edit have views
	# create, update and destroy only perform processing
	
	# Trigger only in create and update actions from respective views through URL value
	before_filter :check_for_cancel, :only => [:create, :update]
	def check_for_cancel
		# if value == Cancel, redirect to index
		if params[:commit] == "Cancel"
			redirect_to basketball_index_path
		end
	end
	
	# Can't declare private, new.html.erb uses this parameter
	def basketball_params
		params[:basketball].permit(:date, :time, :team1, :team2, :location, :status, :winner, :score)
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
		@teams = Teams.all #bad bad bad name for a single obj
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
		# Create a new instance variable
		# the id is passed to edit.html.erb by index, we can use the params hash to find that record
		# Store it in the variable to be used in the page
		@basketball = Basketball.find(params[:id])
		@teams = Teams.all # Need it again to populate teams dropdown
	end
	
	# Updating a basketball, form on the edit page will submit to update action which will update it in DB
	def update
		@basketball = Basketball.find(params[:id])
		
		if @basketball.update_attributes(basketball_params)
			# Redirect to index, create a flash message to display in index
			redirect_to basketball_index_path, :notice => "Success! Event was successfully updated"
		else
			# Failed submit, render edit again
			render "edit"
		end
	end
	
	# Delete a post
	def destroy
	
	end
end
