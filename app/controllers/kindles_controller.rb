class KindlesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_kindle, only: [:show, :edit, :update, :destroy]

  # GET /kindles
  # GET /kindles.json
  def index
    @kindles = current_user.kindles
  end

  # GET /kindles/1
  # GET /kindles/1.json
  def show
  end

  # GET /kindles/new
  def new
    @kindle = Kindle.new
  end

  # GET /kindles/1/edit
  def edit
  end

  # POST /kindles
  # POST /kindles.json
  def create
    @kindle = Kindle.new(kindle_params)
    @kindle.user = current_user

    respond_to do |format|
      if @kindle.save
        format.html { redirect_to @kindle, notice: 'Kindle was successfully created.' }
        format.json { render :show, status: :created, location: @kindle }
      else
        format.html { render :new }
        format.json { render json: @kindle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /kindles/1
  # PATCH/PUT /kindles/1.json
  def update
    respond_to do |format|
      if @kindle.update(kindle_params)
        format.html { redirect_to @kindle, notice: 'Kindle was successfully updated.' }
        format.json { render :show, status: :ok, location: @kindle }
      else
        format.html { render :edit }
        format.json { render json: @kindle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kindles/1
  # DELETE /kindles/1.json
  def destroy
    @kindle.destroy
    respond_to do |format|
      format.html { redirect_to kindles_url, notice: 'Kindle was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kindle
      @kindle = current_user.kindles.find_by id: params[:id]
      raise NotFound unless @kindle.present?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def kindle_params
      params.require(:kindle).permit(:name, :email)
    end
end
