class Section < ActiveRecord::Base
  has_many :questions, -> { order('created_at') }

  def to_s
    name
  end

  def to_param
    "#{id}-#{name.parameterize}"
  end
end
