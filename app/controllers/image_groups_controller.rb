class ImageGroupsController < ApplicationController
  # GET /image_groups
  # GET /image_groups.json
  def index
    @category_id = params[:category_id]
    page = params[:page]
    if @category_id == nil
    	@category_id = 1
    end
    
    @image_groups = ImageGroup.order("weight_factor asc").where(" category_id = '#{@category_id}'").page(page)
  end

  # GET /image_groups/1
  # GET /image_groups/1.json
  def show
    @image_group = ImageGroup.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @image_group }
    end
  end

  # GET /image_groups/new
  # GET /image_groups/new.json
  def new
    @image_group = ImageGroup.new
    @category_id = params[:category_id]
    puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
    puts "xxxx" unless  !@image_group.id.nil? 
    puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @image_group }
      #format.js { render js:"$('#subpage-pane').html('<%= j render :partial=>form %>')" }
      format.js {}
    end
  end

  # GET /image_groups/1/edit
  def edit
    @image_group = ImageGroup.find(params[:id])
  end

  # POST /image_groups
  # POST /image_groups.json
  def create
    @image_group = ImageGroup.new(params[:image_group])
    puts params[:image_group]
    puts params[:image_group][:enabled]
    
    
    respond_to do |format|
      if @image_group.save
        format.html { redirect_to @image_group, notice: 'Image group was successfully created.' }
        format.json { render json: @image_group, status: :created, location: @image_group }
        format.js
      else
        format.html { render action: "new" }
        format.json { render json: @image_group.errors, status: :unprocessable_entity }
        format.js
      end
    end

    p @image_group.errors.full_messages
  end

  # PUT /image_groups/1
  # PUT /image_groups/1.json
  def update
    puts params[:image_group]
    puts params[:image_group][:promoted]
    p ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
    if !params[:images][:removed].blank?
      puts "removed images" + params[:images][:removed]
      removedImages = Image.where(" id in (?)", params[:images][:removed].split(','))

      #remove the image from a group
      removedImages.each do |ri|
        ri.group_id=nil
        ri.save
      end
    end

    if !params[:images][:added].blank?
      puts "new added images" + params[:images][:added]
      addedImages = Image.where(" id in (?)", params[:images][:added].split(','))

      #remove the image from a group
      addedImages.each do |ai|
        ai.group_id=params[:id]
        ai.save
      end
    end    


    @image_group = ImageGroup.find(params[:id])

    if params[:image_group][:cover_image_id].nil?
      @image_group.errors.add(:nil_cover, "必须指定封面图片才能使该图组生效")
      return
    elsif @image_group.images.nil?
      @image_group.errors.add(:nil_images, "必须指定内容图片才能使该图组生效")
      return    
    end

    respond_to do |format|
      if @image_group.update_attributes(params[:image_group])
        format.html { redirect_to @image_group, notice: 'Image group was successfully updated.' }
        format.json { head :no_content }
        format.js {}
      else
        format.html { render action: "edit" }
        format.json { render json: @image_group.errors, status: :unprocessable_entity }
        format.js {}
      end
    end
  end

  # DELETE /image_groups/1
  # DELETE /image_groups/1.json
  def destroy
    @image_group = ImageGroup.find(params[:id])
    @image_group.destroy

    respond_to do |format|
      format.html { redirect_to image_groups_url }
      format.json { head :no_content }
      format.js {}
    end
  end

  def image_select
   group_id = params[:group_id]
   @group = ImageGroup.find_by_id(params[:group_id])

   @contentSelection = params[:content]

   @images = @group.images.page(1)

   if params[:content] == "true"
    @available_images = Image.where(" enabled = true and (group_id is null or group_id = '')").page(1)
  end
  puts @available_images
end
end
