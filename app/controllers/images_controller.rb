class ImagesController < ApplicationController
  before_action :set_image, only: %i[ show edit update destroy ]
  before_action :require_user, except: [:show, :index]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  # GET /images or /images.json
  def index
    @images = Image.paginate(page: params[:page], per_page: 5)
  end

  # GET /images/1 or /images/1.json
  def show
  end

  # GET /images/new
  def new
    @image = Image.new
  end

  # GET /images/1/edit
  def edit
  end

  # POST /images or /images.json
  def create
    @image = Image.new(image_params)
    @image.user = current_user
    respond_to do |format|
      if @image.save
        format.html { redirect_to @image, notice: "Image was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /images/1 or /images/1.json
  def update
    respond_to do |format|
      if @image.update(image_params)
        format.html { redirect_to @image, notice: "Image was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /images/1 or /images/1.json
  def destroy
    File.delete('public/' + @image.picture.url) if @image.picture.url
    @image.destroy!
    respond_to do |format|
      format.html { redirect_to images_url, notice: "Image was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image
      @image = Image.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def image_params
      params.require(:image).permit(:title, :picture, :description)
    end

    def require_same_user
      if current_user != @image.user
        flash[:alert] = "You can only edit or delete your own images."
        redirect_to @image
      end
    end
end
