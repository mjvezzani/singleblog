require 'spec_helper'

describe Post do

  before { @post = Post.new(title: "This is my post", body: "This is the body of my sample post") }
  
  subject { @post }
  
  it { should respond_to(:title) }
  it { should respond_to(:body) }
  
  it { should be_valid }
  
  describe "when title is not present" do
    before { @post.title = " " }
    it { should_not be_valid }
  end
  
  describe "when title is too short" do
    before { @post.title = "a" * 4 }
    it { should_not be_valid }
  end
  
  describe "when title is nil" do
    before { @post.title = nil }
    it { should_not be_valid }
  end
  
  describe "when body is not present" do
    before { @post.body = " " }
    it { should_not be_valid }
  end
  
  describe "when body is too short" do
    before { @post.body = "a" * 19 }
    it { should_not be_valid }
  end
  
  describe "when body is nil" do
    before { @post.body = nil }
    it { should_not be_valid }
  end

end
