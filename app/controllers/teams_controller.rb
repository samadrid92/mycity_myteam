class TeamsController < ApplicationController
  def index

  end

  def 




  private

    def set_city
      @city = City.find(params[:city_id])
    end

    def post_params
      params.require(:post).permit(:title, :content, :city_id, :user_id)
    end

    def find_post
    # This assumes you have an association set up as needed
      @post = Post.find_by_id(params[:id])

      if @post.nil?
        redirect_to root_path
      end
    end
end
