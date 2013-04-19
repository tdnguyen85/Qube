class ResultsController < ApplicationController
	before_filter :connection

	def connection
		@connection = @graph.get_connection('me', 'friends')
	end

	def create

	end



end