class Answer < ActiveRecord::Base
  belongs_to :question
  
  scope :correct, -> { where :correct => true }
end
