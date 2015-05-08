class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end

  def create
    @tweet = Tweet.new(tweet_params)

    if @tweet.save
      render :json => { message: "saved" }
    else
      render :json => { message: "not saved" }
    end
  end

  def show
    # "/posts/1"
    @tweet = Tweet.find_by_id(params[:id])

    if @tweet.nil?
      render :json => {
        message: "Cannot find tweet with id=#{params[:id]}"
      }
    end
  end

  private

  def tweet_params
    params.require(:tweet).permit(:content, :author_name)
  end
end
