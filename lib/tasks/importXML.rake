#imports xml from an exported blogger feed
require 'rss'
require 'htmlentities'
namespace :db do
  task :import, [:filename] => [:environment] do | task, args |
  xml = File.read(args[:filename])
    feed = RSS::Parser.parse xml
		coder = HTMLEntities.new
    feed.items.each do | item |
      Post.create(
				[:content => coder.decode(item.content),

				:title => ActionView::Helpers::SanitizeHelper.strip_tags(item.title),
				:created_at => item.published, :user_id => 4, :notebook_id => 3 ])
    end
  end
end