class Post < ApplicationRecord
	belongs_to :user
	belongs_to :notebook
	has_rich_text :content
	
	def sani_date
		self.created_at.strftime('%Y-%m-%d')
	end
	
	def notebook_title
		self.notebook.title
	end
	
	def post_header
		if self.notebook.nil? && !self.title.empty?
			self.title
		elsif !self.notebook.nil? && self.title.empty?
			self.notebook_title + ' : untitled'
		elsif self.notebook.nil? && self.title.empty?
			'unassigned : untitled'
		else
			self.notebook_title + ' : ' + self.title
		end
	end
end
