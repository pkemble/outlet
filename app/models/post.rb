class Post < ApplicationRecord
	belongs_to :user
	belongs_to :notebook
	
	def sani_date
		self.created_at.strftime('%Y-%m-%d')
	end
	
	def notebook_title
		Notebook.find(self.notebook_id).title
	end
	
	def post_header
		if self.notebook_id == 0 && !self.title.empty?
			self.title
		elsif self.notebook_id != 0 && self.title.empty?
			self.notebook_title + ' : untitled'
		elsif self.notebook_id == 0 && self.title.empty?
			'unassigned : untitled'
		else
			self.notebook_title + ' : ' + self.title
		end
	end
end
