class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_filter :check_user, only: [:edit, :update, :destroy]
  # GET /listings
  # GET /listings.json
  def seller
     @listings = Listing.where(user: current_user).order("created_at DESC")
  end

  def index
      @listings = Listing.where(updated_at: (Time.now - 48.hours)..Time.now).order("created_at DESC")
  end

  def real_estate
    @listings = Listing.where(category_id: 12, updated_at: (Time.now - 168.hours)..Time.now).order("created_at DESC")
  end

  def commercial
    @listings = Listing.where(category_id: 17, updated_at: (Time.now - 168.hours)..Time.now).order("created_at DESC")
  end
  
  def land
    @listings = Listing.where(category_id: 16, updated_at: (Time.now - 168.hours)..Time.now).order("created_at DESC")
  end
  
  def for_rent
    @listings = Listing.where(category_id: 11, updated_at: (Time.now - 168.hours)..Time.now).order("created_at DESC")
  end

  def room_for_rent
    @listings = Listing.where(category_id: 13, updated_at: (Time.now - 168.hours)..Time.now).order("created_at DESC")
  end

  def in_search_of
    @listings = Listing.where(category_id: 14, updated_at: (Time.now - 168.hours)..Time.now).order("created_at DESC")
  end
  
  def electronics
    @listings = Listing.where(category_id: 15, updated_at: (Time.now - 168.hours)..Time.now).order("created_at DESC")
  end

  def pets
    @listings = Listing.where(category_id: 2, updated_at: (Time.now - 168.hours)..Time.now).order("created_at DESC")
  end

  def automotive
    @listings = Listing.where(category_id: 9, updated_at: (Time.now - 168.hours)..Time.now).order("created_at DESC")
  end

  def motorized
    @listings = Listing.where(category_id: 1, updated_at: (Time.now - 168.hours)..Time.now).order("created_at DESC")
  end

  def employment
    @listings = Listing.where(category_id: 10, updated_at: (Time.now - 168.hours)..Time.now).order("created_at DESC")
  end

  def lost_found
    @listings = Listing.where(category_id: 8, updated_at: (Time.now - 366.hours)..Time.now).order("created_at DESC")
  end

  def household
    @listings = Listing.where(category_id: 7, updated_at: (Time.now - 168.hours)..Time.now).order("created_at DESC")
  end

  def sporting_goods
    @listings = Listing.where(category_id: 6, updated_at: (Time.now - 168.hours)..Time.now).order("created_at DESC")
  end

  def wanted
    @listings = Listing.where(category_id: 5, updated_at: (Time.now - 168.hours)..Time.now).order("created_at DESC")
  end

  def ranching
    @listings = Listing.where(category_id: 4, updated_at: (Time.now - 168.hours)..Time.now).order("created_at DESC")
  end

  def fire_wood
    @listings = Listing.where(category_id: 3, updated_at: (Time.now - 168.hours)..Time.now).order("created_at DESC")
  end



  # GET /listings/1
  # GET /listings/1.json
  def show
  end

  # GET /listings/new
  def new
    @listing = Listing.new
  end

  # GET /listings/1/edit
  def edit
  end

  # POST /listings
  # POST /listings.json
  def create
    @listing = Listing.new( listing_params )
    @listing.user_id = current_user.id
    respond_to do |format|

      if @listing.save
          format.html { redirect_to @listing, notice: 'Listing was successfully created.' }
          format.json { render :show, status: :created, location: @listing }
      else
        format.html { render :new }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /listings/1
  # PATCH/PUT /listings/1.json
  def update
    respond_to do |format|
      if @listing.update(listing_params)
        format.html { redirect_to @listing, notice: 'Listing was successfully updated.' }
        format.json { render :show, status: :ok, location: @listing }
      else
        format.html { render :edit }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /listings/1
  # DELETE /listings/1.json
  def destroy
    @listing.destroy
    respond_to do |format|
      format.html { redirect_to listings_url, notice: 'Listing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing
      @listing = Listing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def listing_params
      params.require(:listing).permit(:name, :description, :price, :category_id, :image)
    end

    def check_user
      if current_user != @listing.user
        redirect_to root_url, alert: "Sorry, this listing belongs to someone else"
      end
    end
  end



