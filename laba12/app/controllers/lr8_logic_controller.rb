class Lr8LogicController < ApplicationController
  def input; end

  def output
    v1 = params[:v1]
    @result = root(v1)
    @mean = @result[@result.size - 1]
  end
end

def root(num)
  if num == '0'
    arr = 0
  elsif !(num =~ /\A[-+]?[0-9]*\.?[0-9]+\Z/).nil?
    num = num.to_i
    arr = []
    prev = rand(1..num).to_f
    curr = (prev + num / prev) / 2.0
    arr.push(curr)
    loop do
      curr = (curr + num / curr) / 2.0
      arr.push(curr)
      break if ((curr**2 - num) / num.to_f) < 1e-3
    end
  else
    arr = 'error'
  end
  arr
end