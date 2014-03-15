class Question < ActiveRecord::Base
  belongs_to :section
  has_many :answers

  scope :chronological, -> { order(created_at: :asc) }

  def prev
    section.questions.where('id != ? and created_at <= ?', id, created_at).order(created_at: :desc).first
  end

  def next
    section.questions.where('id != ? and created_at >= ?', id, created_at).order(created_at: :asc).first
  end  
end
