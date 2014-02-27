class PinsController < ApplicationController

  before_filter :authenticate_user!, except: [:index,:show,:inf,:top,:pins_feed,:feed, :search, :update_voting]
  # GET /pins
  # GET /pins.json
  def index

    @pins = Pin.order("created_at desc").page(params[:page]).per_page(50)

     respond_to do |format|
      format.html
      format.rss { render :layout => false }
      format.xml
      format.json { render json: @pins }

  end
end

def pins_feed
  @pins = Pin.order("created_at desc").page(params[:page]).per_page(50)
  # this will be our Feed's update timestamp
    respond_to do |format|
    format.html
    format.atom { render :layout => false }
    # we want the RSS feed to redirect permanently to the ATOM feed
    format.rss { redirect_to pins_feed_path(:format => :atom), :status => :moved_permanently }
  end
# feed = Feedzirra::Feed.fetch_and_parse("http://feeds.feedburner.com/clecotech.in")
# @entry = feed.entries

end

  def feed
   @pins = Pin.order("created_at desc").page(params[:page]).per_page(50)
    respond_to do |format|
      format.html
      format.rss { render :layout => false }
      format.atom { render :layout => false }
    end
  end
  
  def top
    @pins = Pin.top_rated
    respond_to do |format|
      format.html
      format.json { render json: @pins }
    end
  end

  def inf
     @pins = Pin.order("created_at desc").page(params[:page]).per_page(10)
      respond_to do |format|
      format.js
      format.json { render json: @pins }
    end
  end

  # GET /pins/1
  # GET /pins/1.json
  def show

    @pin = Pin.find(params[:id])
    @relative_pins = []
    if !@pin.category_id.blank?
      @relative_pins += Pin.where(category_id: @pin.category_id).where("id != ?", @pin.id)  
    end
    
    if !@pin.brand.blank?
      @relative_pins += Pin.where(brand: @pin.brand).where("id != ?", @pin.id)
    end
    
    if !@pin.created_by.blank?
      @relative_pins += Pin.where(brand: @pin.brand).where("id != ?", @pin.id)
    end
    
    @relative_pins.uniq!  
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pin }
    end
  end

  # GET /pins/new
  # GET /pins/new.json
  def new

    @pin = current_user.pins.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pin }
    end
  end

  # GET /pins/1/edit
  def edit
    @pin = Pin.find(params[:id])
  end

  # POST /pins
  # POST /pins.json
  def create

    @pin = current_user.pins.new(params[:pin])

    respond_to do |format|
      if @pin.save
        format.html { redirect_to @pin, notice: 'Funny Fake Ads was successfully created.' }
        format.json { render json: @pin, status: :created, location: @pin }
      else
        format.html { render action: "new" }
        format.json { render json: @pin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pins/1
  # PUT /pins/1.json
  def update
    @pin = Pin.find(params[:id])

    respond_to do |format|
      if @pin.update_attributes(params[:pin])
        format.html { redirect_to @pin, notice: 'Funny Fake Ads was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pins/1
  # DELETE /pins/1.json
  def destroy

    @pin = Pin.find(params[:id])
    @pin.destroy

    respond_to do |format|
      format.html { redirect_to pins_url }
      format.json { head :no_content }
    end
  end
  
  def search
    @pins = Pin.joins("left join categories on categories.id = pins.category_id").where("lower(categories.name) like :search or lower(description) like :search or lower(slug) like :search or lower(brand) like :search", 
              {search: '%' + params[:search].to_s.downcase + '%'})
              .page(params[:page]).per_page(10)
    
    
    if @pins.empty?
      @random_pins = []
      max_random = rand(5) + 5
      pins = Pin.all
      max_random = pins.size if max_random >= pins.size
      while(@random_pins.size < max_random)
        @random_pins.push(pins[rand(pins.size)])
      end
      @random_pins.uniq!  
    end
     respond_to do |format|
      format.html
      format.rss { render :layout => false }
      format.xml
      format.json { render json: @pins }
    end  
  end
  
  def update_voting
    pin = Pin.find(params[:id])

    if params[:like] == "false"
       pin.update_attributes({voting: pin.voting.to_i - 1})
    else
       pin.update_attributes({voting: pin.voting.to_i + 1}) 
    end
    render json: {success: true, voting_number: pin.voting.to_i, voting_id: pin.id}
  end
end
