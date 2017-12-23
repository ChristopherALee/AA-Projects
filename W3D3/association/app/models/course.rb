class Course < ApplicationRecord
  has_many :enrollments, {
    class_name: 'Enrollment',
    primary_key: :id,
    foreign_key: :course_id
  }
  
  has_many :enrolled_students, through: :enrollments, source: :user
  
  # has_one :prerequisite, through: :prereq_id, source: :name
  
  belongs_to :prerequisite, {
    class_name: 'Course',
    primary_key: :id,
    foreign_key: :prereq_id
  }
  
  belongs_to :instructor, {
    class_name: 'User',
    primary_key: :id,
    foreign_key: :instructor_id
  }
end
