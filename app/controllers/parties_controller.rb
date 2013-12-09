class PartiesController < ApplicationController
  before_filter :authenticate_user!

  # GET /parties
  # GET /parties.json
  def index
    @parties = Party.where(user_id: current_user)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @parties }
    end
  end

  # GET /parties/1
  # GET /parties/1.json
  def show
    redirect_to edit_party_url(params[:id]) and return
    #@party = Party.find(params[:id])

    #respond_to do |format|
      #format.html # show.html.erb
      #format.json { render json: @party }
    #end
  end

  # GET /parties/new
  # GET /parties/new.json
  def new
    @party = Party.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @party }
    end
  end

  # GET /parties/1/edit
  def edit
    @party = Party.find(params[:id])
    @attendants = AttendantsService.get_for_event(@party.permalink, current_user)
    @menu = MenusService.get_for_user(current_user)
  end

  # POST /parties
  # POST /parties.json
  def create
    @party = Party.new(params[:party])
    @party.owner = current_user

    respond_to do |format|
      if @party.save
        format.html { redirect_to @party, notice: 'Party was successfully created.' }
        format.json { render json: @party, status: :created, location: @party }
      else
        format.html { render action: "new" }
        format.json { render json: @party.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /parties/1
  # PUT /parties/1.json
  def update
    @party = Party.find(params[:id])

    respond_to do |format|
      if @party.update_attributes(params[:party])
        format.html { redirect_to @party, notice: 'Party was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @party.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parties/1
  # DELETE /parties/1.json
  def destroy
    @party = Party.find(params[:id])
    @party.destroy

    respond_to do |format|
      format.html { redirect_to parties_url }
      format.json { head :no_content }
    end
  end
end
