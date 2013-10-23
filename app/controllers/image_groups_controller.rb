class ImageGroupsController < ApplicationController
  # GET /image_groups
  # GET /image_groups.json
  def index
    @image_groups = ImageGroup.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @image_groups }
    end
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

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @image_group }
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

    respond_to do |format|
      if @image_group.save
        format.html { redirect_to @image_group, notice: 'Image group was successfully created.' }
        format.json { render json: @image_group, status: :created, location: @image_group }
      else
        format.html { render action: "new" }
        format.json { render json: @image_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /image_groups/1
  # PUT /image_groups/1.json
  def update
    @image_group = ImageGroup.find(params[:id])

    respond_to do |format|
      if @image_group.update_attributes(params[:image_group])
        format.html { redirect_to @image_group, notice: 'Image group was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @image_group.errors, status: :unprocessable_entity }
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
    end
  end
end
