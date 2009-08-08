paperclip_hacks - Paperclip's Evil Twin
=======================================

This is a Ruby on Rails plugin that adds some functionality to the [Paperclip](http://github.com/thoughtbot/paperclip/tree/master) plugin.
It adds the ability to create Amazon S3 authenticated URL's for attachments that are not public. Another feature is a new model attribute for
easier deletion of attachments.


Installation
============

This plugin requires that the [Paperclip](http://github.com/thoughtbot/paperclip/tree/master) plugin is installed.

As a Rails Plugin
-----------------

Use this to install as a plugin in a Ruby on Rails app:

	$ script/plugin install git://github.com/logandk/paperclip_hacks.git


As a Rails Plugin (using git submodules)
----------------------------------------

Use this if you prefer the idea of being able to easily switch between using edge or a tagged version:

	$ git submodule add git://github.com/logandk/paperclip_hacks.git vendor/plugins/paperclip_hacks



Usage
=====

After installation, the new functionality is automatically added to your existing [Paperclip](http://github.com/thoughtbot/paperclip/tree/master) installation.
Where you would normally use this:

	<%= image_tag @person.avatar.url %>
	
You can use this method to generate an S3 authenticated URL:

	<%= image_tag @person.avatar.authenticated_url %>
	
If you wish to delete the avatar upon save, simply do this:

	@person.avatar_destroy = true
	
This method can be used to ease attachment deletion in forms:

	<%= form.check_box :avatar_destroy, {}, "true" %>


Credits
=======
Copyright (c) 2009 Logan Raarup, released under the MIT license