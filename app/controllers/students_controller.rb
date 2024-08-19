class StudentsController < ApplicationController
  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to @student
    else
      render 'new'
    end
  end

  def edit
    @student = Student.find(params[:id])
  end

  def show
    @student = Student.find(params[:id])
  end

  def index
    search = params[:query]
    if search.present?
      @students = Student.where("name LIKE ?", "%#{search}%")
    else
      @students = Student.all
    end
    render 'index'
  end

  def student_params
    params.require(:student).permit(:name, :birthday, :hometown)
  end
end
