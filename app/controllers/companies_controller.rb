class CompaniesController < ApplicationController
  before_action :set_company, except: [:index, :create, :new]

  def index
    @datatable = CompaniesDatatable.new
  end

  def new
    @company = Company.new
  end

  def show
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      redirect_to companies_path, notice: "Saved"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @company.update(company_params)
      redirect_to company_path, company: @company, notice: "Changes Saved"
    else
      render :edit, notice: "Could not save changes"
    end
  end

  private
    def company_params
      params.require(:company).permit(
        :name,
        :description,
        :zip_code,
        :phone,
        :email,
        services: [],
        business_owner_attributes: [
          :id,
          :_destroy,
          :first_name,
          :last_name,
          :email
        ]
      )
    end

    def set_company
      @company = Company.find(params[:id])
    end
end
