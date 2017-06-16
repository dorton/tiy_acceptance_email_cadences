class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]
  include ActionView::Helpers::DateHelper

  # GET /students
  # GET /students.json
  def index
    @cohort = Cohort.find(params[:cohort_id])
    @students = @cohort.students.all
  end

  # GET /students/1
  # GET /students/1.json
  def show
    @cohort = Cohort.find(params[:cohort_id])
    @time_to_class = distance_of_time_in_words(Date.today, @cohort.start_date)
    @weekly_challenge = CodeChallenge.weekly(@cohort.start_date)
    @announcements = @cohort.announcements.where(meetup: false).where('date > ?', Date.today).where('date < ?', Date.today + 3.weeks)
    @todos = Student.todos(@student, @cohort.start_date)
    @meetups = @cohort.announcements.where(meetup: true).where('date > ?', Date.today).where('date <= ?', Date.today + 8.days)
  end

  def send_mail
    @cohort = Cohort.find(params[:cohort_id])
    @students = @cohort.students
    @students.ok_to_email.each do |student|
      StudentMailer.weekly_mailer(@cohort, student).deliver_later
    end
  end

  def import
    @cohort = Cohort.find(params[:cohort_id])
    @file = params[:file]
    if Student.import(@file, @cohort)
      redirect_to cohort_path(@cohort), notice: "Done and Done."
    end
  end

  # GET /students/new
  def new
    @cohort = Cohort.find(params[:cohort_id])
    @student = @cohort.students.new
  end

  # GET /students/1/edit
  def edit
    @cohort = Cohort.find(params[:cohort_id])
  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(student_params)

    respond_to do |format|
      if @student.save
        format.html { redirect_to @student, notice: 'Student was successfully created.' }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
     @student.update(student_params)
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url, notice: 'Student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:student).permit(:first_name, :last_name, :email, :down_payment, :financially_cleared, :enrollment_agreement, :transcript, :yes_we_code, :cohort_id, :do_not_send)
    end
end
