class BasketballController < ApplicationController
	# index, show, new and edit have views
	# create, update and destroy only perform processing
	
	def index
		# create an instance variable
		# Store all of the basketball results inside the variable
		@basketballs = Basketball.all
	end
	
	# To show an individual basketball
	def show
	
	end
	
	# Display a form to create a new basketball
	def new
	
	end
	
	# Form from the new action will submit and save to DB
	def create
	
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
