module ApplicationHelper

	def clean_url(str)
		str.starts_with?('http://') ? str : "http://#{str}"
	end

	def display_time(dt)
		dt.strftime("%d/%m/%y 1:%m%p %z")
	end

			
		
			
		

end
