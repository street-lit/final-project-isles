class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user

  # GET /comments/1
  # GET /comments/1.json
  def show
    @comment = Comment.find(params[:id])
    authorize @comment
  end

  # GET /comments/1/edit
  def edit
    @comment = Comment.find(params[:id])
    authorize @comment
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      respond_to do |f|
        f.html do |f|
          redirect_to :back
        end
        f.json do
          render json: @comment.to_json(:include => :user)
        end
      end
    else
      flash[:alert] = 'Errors'
      render :back
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment.post, notice: 'Comment was updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { redirect_to :back, notice: "Comment was not updated because #{@comment.errors.full_messages.each { |message| message  } }"  }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    authorize @comment
    post = @comment.post
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to post, notice: 'Comment was deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:body, :post_id, :blog_id, :user_id)
    end
end
