class ImagesController < ApplicationController
  # GET /images
  # GET /images.json
  def index
    page = params[:page]
    @images = Image.page(page).per(10)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @images }
      format.js {}
    end
  end

  # GET /images/1
  # GET /images/1.json
  def show
    @image = Image.find(params[:id])

    @images = Image.page(1).per(10)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @image }
      format.js {}
    end
  end

  # GET /images/new
  # GET /images/new.json
  def new
    @image = Image.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @image }
      format.js {}
    end
  end

  # GET /images/1/edit
  def edit
    @image = Image.find(params[:id])
  end

  # POST /images
  # POST /images.json
  def create
    @image = Image.new(params[:image])
    #@images = Image.page(1).per(10)
    
    #@image.save
    #respond_to do |format|
      #format.html # create.html.erb
      #format.json { render json: @image }
      #format.js {} #create.js.erb
    #end
    
    respond_to do |format|  
      if @image.save  
	render :template => "create.js.erb", :formats=>[:js], :handler => [:erb]
        #format.html {  
        #  render :json => [@image.to_json_image].to_json,  
        #  :content_type => 'text/html',  
        #  :layout => false  
        #}  
        #format.json { render json: {files: [@image.to_json_image]}, status: :created, location: @image }  
      else  
        format.html { render action: "new" }  
        format.json { render json: @image.errors, status: :unprocessable_entity }  
      end  
    end  
	

  end

  # PUT /images/1
  # PUT /images/1.json
  def update
    @image = Image.find(params[:id])

    respond_to do |format|
      if @image.update_attributes(params[:image])
        format.html { redirect_to @image, notice: 'Image was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /images/1
  # DELETE /images/1.json
  def destroy
    @image = Image.find(params[:id])
    @image.destroy

    @images = Image.page(1).per(10)

    respond_to do |format|
      format.html { redirect_to images_url }
      format.json { head :no_content }
      format.js {}
    end
  end
end
