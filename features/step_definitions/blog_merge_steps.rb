require 'uri'
require 'cgi'
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "selectors"))

Given /^this user exists:$/ do |fields| 
	#User.create!(Hash[fields.map{ |k, v| [k.to_sym, v] }])
	params = {}
	fields.rows_hash.each do |name, value|
		params[name.to_sym] = value
	end
	User.create!(params)
end

Given /^this article exists:$/ do |fields|
	params = {}
	fields.rows_hash.each do |name, value|
		if name=='user'
			params[name.to_sym] = User.where(:login=>value).first
		else
			params[name.to_sym] = value
		end
	end
	Article.create!(params)
end

Given /^this comment exists:$/ do |fields|
	params = {}
	fields.rows_hash.each do |name, value|
		if name=='user'
			params[name.to_sym] = User.where(:login=>value).first
		elsif name=='article'
			params[name.to_sym] = Article.where(:title=>value).first
		else
			params[name.to_sym] = value
		end
	end
	Comment.create!(params)
end

When /^I merge with "([^"]*)"$/ do |article_name|
	id = Article.where(:title=>article_name).first.id
	step %Q|I fill in "merge_with" with "#{id}"|
	step %Q|I press "Merge"|
end
