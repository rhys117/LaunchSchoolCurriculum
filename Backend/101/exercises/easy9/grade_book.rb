def get_grade(grade_1, grade_2, grade_3)
  avg_score = (grade_1 + grade_2 + grade_3) / 3
  grade = case avg_score
          when 90..100 then 'A'
          when 80..89 then 'B'
          when 70..79 then 'C'
          when 60..69 then 'D'
          else 'F'
          end
end

p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"