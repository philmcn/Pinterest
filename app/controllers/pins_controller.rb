class PinsController < ApplicationController
  before_filter :authenticate_user!, except: [:index,:show,:inf]
  attr_accessor :pin_user_global
  # GET /pins
  # GET /pins.json
  def index
      facebook_like_pin_shorting()
      @pins = $global_fb_pin.paginate(:page => params[:page],:per_page => 10)
      respond_to do |format|
      format.html
      format.json { render json: @pins }
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
      @pins = $global_fb_pin.paginate(:page => params[:page],:per_page => 10)
      respond_to do |format|
      format.js
      format.json { render json: @pins }
    end
  end

  # GET /pins/1
  # GET /pins/1.json
  def show

    @pin = Pin.find(params[:id])

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
    @pin = current_user.pins.find(params[:id])

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

  private
    def facebook_like_pin_shorting()
      if $global_fb_pin.blank?
          @fb_like_count = 0 
          @facebook_likes = []
          @pin_user = []
          @pins = Pin.all
          @pins.each_with_index do |pin,index|
            @graph =Koala::Facebook::RestAPI.new("CAACEdEose0cBAMruhVCMu4NGAtg5nnSOLB8KX118ef2BUYSSUnPGeJjMl9ZBasG0W4ghtag1qTEXu2QZCq9Q5kEjKpEYX4ph7HjZCWeNESlH4MUlCMbn9sZC66TIoD15ayeoGsL70bWldF10AOohbTjj959QYVeKWmUZCZB4yyTboZAvtizZCR6YKhu6PgiXwwW98Mbshkj23AZDZD")
            uid = "http://hidden-chamber-6590.herokuapp.com/pins/#{pin.id}"
            @like_count = @graph.fql_query('select url ,like_count FROM link_stat WHERE url = "' + uid + '"')
            @facebook_likes[@fb_like_count]=pin.id
            @fb_like_count=@fb_like_count+1
            @facebook_likes[@fb_like_count]=@like_count[0]["like_count"]
            @fb_like_count=@fb_like_count+1
          end
          @facebook_likes_hash = Hash[*@facebook_likes]
          @facebook_likes_hash_index = @facebook_likes_hash.sort_by{|k, v| v}.reverse
          @facebook_likes_hash_index.each_with_index do |pin,index|
            @pin_user[index] = Pin.find(pin[0])
          end
          $global_fb_pin = @pin_user
      end
    end
end
