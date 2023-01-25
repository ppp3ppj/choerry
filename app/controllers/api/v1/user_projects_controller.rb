
class Api::V1::UserProjectsController < Api::V1::AppController   
def index
  user_projects = UserProject.all
  render json: user_projects 
end

def create 
  @user_projects = UserProject.new(user_project_params)
  if @user_projects.save
    render json: @user_project, status: :created
  end
   
end

private
def user_project_params
  params.require(:user_project).permit(:user_id, :project_id)
end
end
