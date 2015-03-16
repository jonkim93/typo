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

Given /^I am logged in as "([^"]*)"$/ do |user|
	account = User.where(:name=>user).first
	step %Q|I am on the login page|
	login = account.login
	step %Q|I fill in "user_login" with "#{login}"|
	password = account.password
	step %Q|I fill in "user_password" with "#{password}"|
	step %Q|I press "Login"|
end

When /^I merge with "([^"]*)"$/ do |article_name|
	id = Article.where(:title=>article_name).guid
	step %Q|I fill in "merge_with" with "#{id}"|
	step %Q|I press "Merge"|
end
