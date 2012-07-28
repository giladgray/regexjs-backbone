class RegexesController < ApplicationController
  # GET /regexes
  # GET /regexes.json
  def index
    @regexes = Regex.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @regexes }
    end
  end

  # GET /regexes/1
  # GET /regexes/1.json
  def show
    @regex = Regex.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @regex }
    end
  end

  # GET /regexes/new
  # GET /regexes/new.json
  def new
    @regex = Regex.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @regex }
    end
  end

  # GET /regexes/1/edit
  def edit
    @regex = Regex.find(params[:id])
  end

  # POST /regexes
  # POST /regexes.json
  def create
    @regex = Regex.new(params[:regex])

    respond_to do |format|
      if @regex.save
        format.html { redirect_to @regex, notice: 'Regex was successfully created.' }
        format.json { render json: @regex, status: :created, location: @regex }
      else
        format.html { render action: "new" }
        format.json { render json: @regex.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /regexes/1
  # PUT /regexes/1.json
  def update
    @regex = Regex.find(params[:id])

    respond_to do |format|
      if @regex.update_attributes(params[:regex])
        format.html { redirect_to @regex, notice: 'Regex was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @regex.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /regexes/1
  # DELETE /regexes/1.json
  def destroy
    @regex = Regex.find(params[:id])
    @regex.destroy

    respond_to do |format|
      format.html { redirect_to regexes_url }
      format.json { head :no_content }
    end
  end
end
