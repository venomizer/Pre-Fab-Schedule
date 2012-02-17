class JobItemsController < ApplicationController
  before_filter :load_job

  # GET /job_items
  # GET /job_items.json
  def index
    @job_items = @job.job_items.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @job_items }
    end
  end

  # GET /job_items/1
  # GET /job_items/1.json
  def show
    @job_item = @job.job_items.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @job_item }
    end
  end

  # GET /job_items/new
  # GET /job_items/new.json
  def new
    @job_item = @job.job_items.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @job_item }
    end
  end

  # GET /job_items/1/edit
  def edit
    @job_item = @job.job_items.find(params[:id])
  end

  # POST /job_items
  # POST /job_items.json
  def create
    @job_item = @job.job_items.build(params[:job_item])

    respond_to do |format|
      if @job_item.save
        format.html { redirect_to [@job, @job_item], notice: 'Job item was successfully created.' }
        format.json { render json: @job_item, status: :created, location: @job_item }
      else
        format.html { render action: "new" }
        format.json { render json: @job_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /job_items/1
  # PUT /job_items/1.json
  def update
    @job_item = @job.job_items.find(params[:id])

    respond_to do |format|
      if @job_item.update_attributes(params[:job_item])
        format.html { redirect_to [@job, @job_item], notice: 'Job item was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @job_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /job_items/1
  # DELETE /job_items/1.json
  def destroy
    @job_item = @job.job_items.find(params[:id])
    @job_item.destroy

    respond_to do |format|
      format.html { redirect_to [@job] }
      format.json { head :ok }
    end
  end

  private

    def load_job
      @job = Job.find(params[:job_id])
    end
end
