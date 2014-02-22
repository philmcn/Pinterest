class CategoriesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :check_admin_role
  
  def check_admin_role
    redirect_to root_url if !current_user.has_role? "admin"
  end
  # GET /categories
  # GET /categories.json
  def index
    @categories = Category.where("lower(name) like :search", {search: '%' + params[:search].to_s.downcase + '%'}).
                    order("created_at desc").page(params[:page]).per_page(50)
     respond_to do |format|
      format.html
      format.rss { render :layout => false }
      format.xml
      format.json { render json: @categories }
    end
  end
  # GET /categories/new
  # GET /categories/new.json
  def new
    @category = Category.new
  end
  # GET /categories/create
  # GET /categories/create.json
  def create
    @category = Category.create(params[:category])
    
    if @category.save
      redirect_to categories_path
    else
      render 'new'
    end
         
  end
  # GET /categories/edit
  # GET /categories/edit.json
  def edit
    @category = Category.find(params[:id])
    #@category = Category.new
  end
  # GET /categories/update
  # GET /categories/update.json
  def update
  @category = Category.find(params[:id])
 
    #if @category.update_attributes(params[:category])
    if @category.update_attributes(name: params[:category][:name])
      redirect_to categories_path
    else
      render 'edit'
    end
  end
  # GET /categories/destroy
  # GET /categories/destroy.json
  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    Pin.update_all({category_id: nil, category_id: params[:id]})
    redirect_to categories_path
  end
  
  #
  def pins
    @pins = Pin.joins("left join categories on categories.id = pins.category_id").where("lower(categories.name) like :search or lower(description) like :search or lower(slug) like :search or lower(brand) like :search", 
              {search: '%' + params[:search_cat].to_s.downcase + '%'})
              .page(params[:page]).per_page(10)
    @categories = Category.all
    if request.post?
      update_infos = {}
      params[:categories].each{|id, category_id|
        update_infos[id] = {category_id: category_id}   
      }
      Pin.update(update_infos.keys, update_infos.values)
    end
  end
end


    