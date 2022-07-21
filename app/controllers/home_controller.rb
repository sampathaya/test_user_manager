require 'csv'
require 'import_csv/data'

class HomeController < ApplicationController

  def index
    @users = Person.all.includes(:locations, :affiliations).paginate(page: params[:page], per_page: 10)
  end

  def upload_form
  end

  def upload_process
    file = params[:home][:file]
    data = CSV.parse(file.to_io, headers: true, encoding: 'utf8')

    ImportCsv::Data.new(data).import

    redirect_to root_path
  end
end
