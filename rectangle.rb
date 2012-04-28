class Rectangle

  attr_accessor :active


  def initialize(window, x, y, width, height, layer)
    @window = window
    @x = x
    @y = y
    @width = width
    @height = height
    @layer = layer
    @active = false
  end

  def color
    if @active
      Gosu::Color::RED
    else
      Gosu::Color::WHITE
    end
  end

  def draw
    @window.draw_quad(@x, @y, color, @x+@width, @y, color, @x+@width, @y+@height, color,
                     @x, @y+@height, color)
  end

  def update
    if @window.button_down? Gosu::Button::KbRight
      @width = @width + 10
    end

    if @window.button_down? Gosu::Button::KbLeft
      @width = @width - 10
    end

    if @window.button_down? Gosu::Button::KbDown
      @height = @height + 10
    end

    if @window.button_down? Gosu::Button::KbUp
      @height = @height - 10
    end

    if @window.button_down? Gosu::Button::KbW
      @y = @y - 10
    end

    if @window.button_down? Gosu::Button::KbS
      @y = @y + 10
    end

    if @window.button_down? Gosu::Button::KbA
      @x = @x - 10
    end

    if @window.button_down? Gosu::Button::KbD
      @x = @x + 10
    end
  end
end
