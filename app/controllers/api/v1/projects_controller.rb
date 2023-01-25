
class Api::V1::ProjectsController < Api::V1::AppController   
def index
  projects = Project.all
  render json: projects 
end

def create 
  @project = Project.new(project_params)
  if @project.save
    render json: @project, status: :created
  end
   
end

private
def project_params
  params.require(:project).permit(:name, :memo)
end
end
