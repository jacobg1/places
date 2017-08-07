class GuessesController < ApplicationController
  def index

  end

  def show
    @post = Post.find(params[:post_id])
    @place = @post.place
    @guess = Guess.find(params[:id])
    @guesses = Guess.all
    @guess.score_up
    @guess.save

    redirect_to place_post_path(@place, @post)
  end

  def new
    @post = Post.find(params[:post_id])
    @guess = @post.guesses.new
  end

  def create
    @post = Post.find(params[:post_id])
    @place = @post.place
    @guess = @post.guesses.new(guess_params.merge(user: current_user))
    if @guess.save
      flash[:notice] = 'Guess made!'
      redirect_to place_post_path(@place, @post)
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:post_id])
    @guess = Guess.find(params[:id])
  end

  def update
    @post = Post.find(params[:post_id])
    @place = @post.place
    @guess = Guess.find(params[:id])
    if @guess.user == current_user
      @guess.update(guess_params.merge(user: current_user))
      flash[:notice] = 'Guess updated!'
      redirect_to place_post_path(@place, @post)
    else
      flash[:alert] = 'Only OP can update guess!'
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @place = @post.place
    @guess = Guess.find(params[:id])
    if @guess.user == current_user
       @guess.destroy
       flash[:notice] = 'Guess deleted!'
       redirect_to place_post_path(@place, @post)
    else
       flash[:alert] = 'only OP can delete guess'
       redirect_to place_post_path(@place, @post)
    end
  end

  private
  def guess_params
    params.require(:guess).permit(:guess_text)
  end
end
