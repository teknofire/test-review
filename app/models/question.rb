class Question < ActiveRecord::Base
  ANSWER_TYPES = { 
    :text => 'Text',
    :multiple_choice_radio => 'Multiple Choice w/ Radio', 
    :multiple_choice_checkbox => 'Multiple Choice w/ Checkboxes'
  }

  belongs_to :section
  has_many :answers

  scope :chronological, -> { order(created_at: :asc) }

  validates :text, presence: true
  validates :answer_type, presence: true
  
  accepts_nested_attributes_for :answers, reject_if: ->(a) { a[:text].empty? }, allow_destroy: true

  def prev
    section.questions.where('id != ? and created_at <= ?', id, created_at).order(created_at: :desc).first
  end

  def next
    section.questions.where('id != ? and created_at >= ?', id, created_at).order(created_at: :asc).first
  end  
end
