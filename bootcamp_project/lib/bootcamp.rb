class Bootcamp

    def initialize (name,slogan,student_capacity)
        @name = name 
        @slogan = slogan
        @student_capacity = student_capacity
        @teachers=[]
        @students=[]
        @grades=Hash.new { |hash, key| hash[key] = [] }
    end

    def name
        @name
    end

    def slogan
        @slogan
    end

    def teachers
        @teachers
    end


    def students
        @students
    end

    def hire(teacher)
        @teachers.push(teacher)
    end

    def enroll(student)
        if @students.size<6
            @students.push(*student)
            return true
        else
            @student_capacity
            false
        end
    end

    def enrolled?(student_name)
        return @students.include?student_name
    end

    def student_to_teacher_ratio
        (@students.size/@teachers.size) #.ceil
    end

    def add_grade(student,grade)
        if @students.include?student
            @grades[student].push(grade)
            true
        else
            false
        end
    end

    def num_grades(student)
        @grades[student].size
    end


    def average_grade(student)
        if enrolled?(student)
            if @grades[student].size ==0
                return nil
            else
                total = @grades[student].inject{|acc,el|acc+el}
                return total/(@grades[student].size)
            end
        else
            return nil
        end
    end
                



end
