# frozen_string_literal: true

class Api::V1::ProjectsController < Api::V1::AppController
  def index
    Rails.logger.debug '**************************'
    Rails.logger.debug @current_user
    projects = Project.all
    render json: projects 
  end

  def show; end

  def create 
    @project = Project.new(project_params)
    return unless @project.save

    render json: @project, status: :created
    
     
  end

  private

  def project_params
    params.require(:project).permit(:name, :memo)
  end
end
