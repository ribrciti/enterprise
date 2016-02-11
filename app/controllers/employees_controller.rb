class EmployeesController < ApplicationController

	before_action :set_employee, only: [:show, :edit, :update, :destroy]

  def index
  	@employees = Employee.all
    
    respond_to do |format|
      format.html
      format.csv {render text: @employees.to_csv}      
    end
  end

  def show    
  end

  def new
    @employee = Employee.new
  end

 	def edit
  end

  def create
    @employee = Employee.new(employee_params)
    respond_to do |format|
      if @employee.save
        format.html { redirect_to @employee, notice: 'employee was successfully created.' }
        format.json { render action: 'show', status: :created, location: @employee }
      else
        format.html { render action: 'new' }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to @employee, notice: 'employee was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @employee.destroy
    respond_to do |format|
      format.html { redirect_to employees_url }
      format.json { head :no_content }
    end
  end

  def import
    Employee.import(params[:file])
    redirect_to employees_path, notice:  "Employees Added Successfully"
  end

  private
    
    def set_employee
      @employee = Employee.find(params[:id])
    end

    def employee_params
      params.require(:employee).permit(:name, :phone, :job_type)
    end
end
