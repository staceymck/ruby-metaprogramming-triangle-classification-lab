class Triangle
  attr_accessor :a, :b, :c, :sides
  
  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
    @sides = [a, b, c]
  end

  def invalid?
    sides.any? {|side| side <= 0} || (a + b <= c || a + c <=b || c + b <=a)
  end


  def kind
    if invalid?
      raise TriangleError
    elsif sides.uniq.count == 1
      :equilateral
    elsif sides.uniq.count == 2
      :isosceles
    else
      :scalene
    end

  end

  class TriangleError < StandardError
  end
end
