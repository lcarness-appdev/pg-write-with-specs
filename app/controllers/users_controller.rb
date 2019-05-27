class UsersController < ApplicationController
  def index
    @users = User.all.order({ :username => :asc })

    render("users/index.html.erb")
  end

  def show
    @user = User.where({ :id => params.fetch("id") }).at(0)

    render("users/show.html.erb")
  end

  def own_photos
    @user = User.where({ :id => params.fetch("id") }).at(0)

    render("users/own.html.erb")
  end

  def liked_photos
    @user = User.where({ :id => params.fetch("id") }).at(0)

    render("users/liked.html.erb")
  end

  def feed
    @user = User.where({ :id => params.fetch("id") }).at(0)

    render("users/feed.html.erb")
  end

  def discover
    @user = User.where({ :id => params.fetch("id") }).at(0)

    render("users/discover.html.erb")
  end
  
  def following
    @user = User.where({ :id => params.fetch("id") }).at(0)

    render("users/following.html.erb")
  end
  
  def followers
    @user = User.where({ :id => params.fetch("id") }).at(0)

    render("users/followers.html.erb")
  end
  
  
  def send_request
    p = FollowRequest.new
    p.recipient_id = params.fetch("recipient_id")
    p.sender_id = params.fetch("sender_id")
    if User.where(:id => p.recipient_id).first.private
      p.status = "pending"
    else
      p.status = "accepted"
    end
    
    p.save
    
    redirect_to("/users/" + p.sender_id.to_s + "/following")
  end
  
  
  def accept_follower
    sender_id = params.fetch("sender_id")
    recipient_id = params.fetch("recipient_id")
    
    p = FollowRequest.where(:sender_id => sender_id,:recipient_id => recipient_id).first
    p.status = "accepted"
    p.save
    
    redirect_to("/users/" + p.recipient_id.to_s + "/followers")
  end
  
  
  def reject_follower
    sender_id = params.fetch("sender_id")
    recipient_id = params.fetch("recipient_id")
    
    p = FollowRequest.where(:sender_id => sender_id,:recipient_id => recipient_id).first
    p.status = "rejected"
    p.save
    
    redirect_to("/users/" + p.recipient_id.to_s + "/followers")
  end
  
  
end