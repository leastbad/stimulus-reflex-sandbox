class CounterReflex < ApplicationReflex
  def increment
    @count = element.dataset.count.to_i + 1
  end

  def reset
    @count = 0
  end
end