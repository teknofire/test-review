class Section < ActiveRecord::Base
  has_many :questions

  def to_s
    name
  end

  def to_param
    "#{id}-#{name.parameterize}"
  end
end
