#imports xml from an exported blogger feed
require 'rss'
namespace :db do
  task :import_thw, [:filename] => [:environment] do | task, args |
	  xml_posts = File.read(args[:filename])
	  posts = Nokogiri::XML(xml_posts)
	  posts.xpath('pma_xml_export/database/table').each do | post |
			Post.create(
				[:content => post.at_xpath('column[@name="post_content"]').text,
				:title => post.at_xpath('column[@name="post_title"]').text,
				:created_at => post.at_xpath('column[@name="post_date"]').text, 
				:wpid => post.at_xpath('column[@name="ID"]').text,
				:user_id => 1 ])
    end
  end

	task :import_thw_enclosures, [:filename] => [:environment] do | task, args |
		xml_postmeta = File.read(args[:filename])
		postmeta = Nokogiri::XML(xml_postmeta)
		postmeta.xpath('pma_xml_export/database/table').each do | enclosure |
			post = Post.where(wpid: enclosure.at_xpath('column[@name="post_id"]').text)
			post.update(enclosure: enclosure.at_xpath('column[@name="meta_value"]').text)
		end
	end
end	