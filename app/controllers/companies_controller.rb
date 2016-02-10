class CompaniesController < ApplicationController

before_action :set_company, only: [:show, :edit, :update, :destroy]

  def index
  	@companies = Company.all
    #@search = companySearch.new(params[:search])
    #@companies = @search.all
  end

  def show    
  end

  def new
    @company = Company.new
  end

 	def edit
  end

  def create
    @company = Company.new(company_params)
    respond_to do |format|
      if @company.save
        format.html { redirect_to @company, notice: 'company was successfully created.' }
        format.json { render action: 'show', status: :created, location: @company }
      else
        format.html { render action: 'new' }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to @company, notice: 'company was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @company.destroy
    respond_to do |format|
      format.html { redirect_to companies_url }
      format.json { head :no_content }
    end
  end

  def import
    Company.import(params[:file])
    redirect_to companies_path, notice:  "Companies Added Successfully"
  end

  private
    
    def set_company
      @company = Company.find(params[:id])
    end

    def company_params
      params.require(:company).permit(:name, :manager, :status, :terms)
    end
end