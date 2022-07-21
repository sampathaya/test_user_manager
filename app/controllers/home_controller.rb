require 'csv'
require 'import_csv/data'

class HomeController < ApplicationController
  helper_method :sort_column, :sort_direction

  def index
    all_users = Person.all.includes(:locations, :affiliations)
    all_users = all_users.where('name LIKE ?', params[:search]) if params[:search]
    @users = all_users.paginate(page: params[:page], per_page: 10).order(sort_column+ ' ' + sort_direction)
  end

  def upload_form
  end

  def upload_process
    file = params[:home][:file]
    data = CSV.parse(file.to_io, headers: true, encoding: 'utf8')

    ImportCsv::Data.new(data).import

    redirect_to root_path
  end

  private

  def sort_column
    Person.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
