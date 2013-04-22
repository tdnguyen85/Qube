class BdcardsController < ApplicationController
  # GET /bdcards
  # GET /bdcards.json
  def index
    @bdcards = Bdcard.all
    profile_info

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bdcards }
    end
  end

  # GET /bdcards/1
  # GET /bdcards/1.json
  def show
    set_match
    profile_info

    @bdcard = Bdcard.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bdcard }
    end
  end

  # GET /bdcards/new
  # GET /bdcards/new.json
  def new
    @bdcard = Bdcard.new
    profile_info

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bdcard }
    end
  end

  # GET /bdcards/1/edit
  def edit
    @bdcard = Bdcard.find(params[:id])
    profile_info

  end

  # POST /bdcards
  # POST /bdcards.json
  def create
    @bdcard = Bdcard.new(params[:bdcard])
    profile_info

    respond_to do |format|
      if @bdcard.save
        format.html { redirect_to @bdcard, notice: 'Bdcard was successfully created.' }
        format.json { render json: @bdcard, status: :created, location: @bdcard }
      else
        format.html { render action: "new" }
        format.json { render json: @bdcard.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /bdcards/1
  # PUT /bdcards/1.json
  def update
    @bdcard = Bdcard.find(params[:id])
    profile_info

    respond_to do |format|
      if @bdcard.update_attributes(params[:bdcard])
        format.html { redirect_to @bdcard, notice: 'Bdcard was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bdcard.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bdcards/1
  # DELETE /bdcards/1.json
  def destroy
    @bdcard = Bdcard.find(params[:id])
    @bdcard.destroy
    profile_info

    respond_to do |format|
      format.html { redirect_to bdcards_url }
      format.json { head :no_content }
    end
  end
end
