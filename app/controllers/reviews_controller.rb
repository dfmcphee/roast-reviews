class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :index]

  # GET /reviews
  # GET /reviews.json
  def index
    @reviews = Review.all
  end

  def mine
    @reviews = Review.where(user_id: current_user.id)
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
  end

  # GET /reviews/new
  def new
    if params[:beans_id].present?
      @bean = Bean.find_by_id(params[:beans_id])
      return redirect_to(beans_path, :notice => 'No beans selected for review.') if !@bean
      @review = Review.new
      @review.bean_id = @bean.id
    else
      redirect_to(beans_path, :notice => 'No beans selected for review.')
    end
  end

  # GET /reviews/1/edit
  def edit
    @bean = @review.bean
  end

  # POST /reviews
  # POST /reviews.json
  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @bean = @review.bean

    respond_to do |format|
      if @review.save
        format.html { redirect_to @review, notice: 'Review was successfully created.' }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { render :new }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @review, notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to reviews_url, notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def review_params
    params.require(:review).permit(
      :notes,
      :roast,
      :sour,
      :sweet,
      :bitter,
      :nutty,
      :salty,
      :rating,
      :bean_id
    )
  end
end
