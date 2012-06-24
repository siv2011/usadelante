class StudentsController < ApplicationController
  # GET /students
  # GET /students.json
  def index
    @students = Student.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @students }
    end
  end

  # GET /students/1
  # GET /students/1.json
  def show
    @student = Student.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @student }
    end
  end

  # GET /students/new
  # GET /students/new.json
  def new
    @student = Student.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @student }
    end
  end

  # GET /students/1/edit
  def edit
    @student = Student.find(params[:id])
  end

  # def match_stud
  # end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(params[:student])

    respond_to do |format|
      if @student.save
        format.html { redirect_to @student, notice: 'Student was successfully created.' }
        format.json { render json: @student, status: :created, location: @student }
      else
        format.html { render action: "new" }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /students/1
  # PUT /students/1.json
  def update
    @student = Student.find(params[:id])

    respond_to do |format|
      if @student.update_attributes(params[:student])
        format.html { redirect_to @student, notice: 'Student was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student = Student.find(params[:id])
    @student.destroy

    respond_to do |format|
      format.html { redirect_to students_url }
      format.json { head :no_content }
    end
  end

def match
  results = []
  @students = Student.all
  @students.each do |s|
    if s.status == "Active"
      characteristic_number = 4
      value_characteristic= 1.0/characteristic_number
      count = 0
      scorearray = []
      @students.each do |y|
        sscore =0
        if s.yearofgraduation = y.yearofgraduation
          sscore = sscore + value_characteristic
        end
        if s.group = y.group
          sscore = sscore + value_characteristic
        end
        if s.careertrack = y.careertrack
          sscore = sscore + value_characteristic
        end
        scorearray [count] = sscore
        count = count+1
      end
      z=scorearray.index(scorearray.max)
        # if CHECK PREVIOUS PAIRINGS
        # end
      results.append([s.studentid,@students[z].studentid])
    end
  end
  @results = results
  render :match
end

end
