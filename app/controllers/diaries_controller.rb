class DiariesController < ApplicationController

before_filter :require_login, only: [:create, :destroy, :edit, :update]

  def search
    @diaries = Diary.search params[:search]
  end

  # GET /diaries
  # GET /diaries.json
  def index
    @diaries = Diary.all.reverse

    respond_to do |format|
      format.html # index.html.erb
      format.xml { render xml: @diaries }

        @search = Diary.search do
    fulltext params[:search]
  end
  @diaries = @search.results
 end
end

  # GET /diaries/1
  # GET /diaries/1.json
  def show
    @diary = Diary.find(params[:id])

    # respond_to do |format|
    #   format.html # show.html.erb
    #   format.json { render json: @diary }
  
  end

  # GET /diaries/new
  # GET /diaries/new.json
  def new
    @diary = Diary.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @diary }
      format.js
    end
  end

  # GET /diaries/1/edit
  def edit
    @diary = Diary.find(params[:id])
  end

  # POST /diaries
  # POST /diaries.json
  def create
    @diary = Diary.create!(params[:diary])
    respond_to do |format|
        format.html { redirect_to diaries_url }
        format.js
    end
  end
  # PUT /diaries/1
  # PUT /diaries/1.json
  def update
    @diary = Diary.find(params[:id])
    @diary.update_attributes!(params[:diary])

    respond_to do |format|
        format.html { redirect_to @diary, notice: 'Diary was successfully updated.' }
        format.js
    end
  end

  # DELETE /diaries/1
  # DELETE /diaries/1.json
  def destroy
    @diary = Diary.destroy(params[:id])
    respond_to do |format|
      format.html { redirect_to @diaries }
      format.js
    end
  end
end
