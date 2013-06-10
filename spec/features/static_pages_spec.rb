require 'spec_helper'

describe "StaticPages" do
  
  describe "Sign In Page" do
    it "should have the title 'Quote of the Day | Sign In'" do
      visit signin_path
      page.should have_selector('title', :text => 'Quote of the Day | Sign In')
    end
    
    it "should have the headline 'Sign In'" do
      visit signin_path
      page.should have_selector('h3', :text => 'Sign In')
    end
    
    it "should have a form with a username and password field" do
      visit signin_path
      find_field('Username').visible?
      find_field('Password').visible?
    end
    
    it "should have a footer with some basic copyright information present" do
      visit signin_path
      page.should have_selector('footer', :text => 'Broken Router Rails, 2013')
    end
    
  end
  
  describe "Home page with user signed in" do
    
    it "should have an h2 tag with the text 'List of Blog Posts'" do
      visit home_path
      page.should have_selector('h2', :text => 'List of Blog Posts')
    end
    
    it "should have a list of blog posts" do
      visit home_path
      Post.all.each do |post|
        page.should have_selector('li', :text => post.title)
        page.should have_selector('li', :text => post.body)
      end
    end
    
  end
  
  describe "Home page with moderator signed in" do
    
    it "should have an h2 tag with the text 'List of Blog Posts'" do
      visit home_path
      page.should have_selector('h2', :text => 'List of Blog Posts')
    end
    
    it "should have a list of the blog posts" do
      visit home_path
      Post.all.each do |post|
        page.should have_selector('li', :text => post.title)
        page.should have_selector('li', :text => post.body)
      end
    end
    
  end
  
  describe "home page with admin signed in" do
    
    it "should have an h2 with the text 'List of Blog Posts'" do
      visit home_path
      page.should have_selector('h2', :text => 'List of Blog Posts')
    end
    
    it "should have a list of blog posts" do
      visit home_path
      Post.all.each do |post|
        page.should have_selector('li', :text => post.title)
        page.should have_selector('li', :text => post.body)
      end
    end
    
  end
  
  
end
