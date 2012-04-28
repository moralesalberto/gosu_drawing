class Window < Gosu::Window

  def initialize
    @width = 800
    @height = 600
    super(@width, @height, false)
    @rectangles = []
    @active_rectangle = nil
  end

  def draw
    @rectangles.each {|rectangle| rectangle.draw}
  end

  def update
    add_more_rectangles
    if @rectangles.size > 0
      switch_active_rectangle
    end
    if @active_rectangle
      @active_rectangle.update 
    end
  end

  def add_more_rectangles
    if button_down? Gosu::Button::KbN
      @pressed_n = true 
    end

    if !(button_down? Gosu::Button::KbN) and @pressed_n == true
      @pressed_n = false
      add_rectangle
    end
  end

  def add_rectangle
    layer = @rectangles.size + 1
    this_rectangle = Rectangle.new(self, rand(@width),rand(@height),100, 30, layer)
    @rectangles << this_rectangle
    make_active(this_rectangle)
  end

  def switch_active_rectangle
    if button_down? Gosu::Button::KbSpace
      @pressed_space = true
    end
    if !(button_down?(Gosu::Button::KbSpace)) and @pressed_space == true
      @pressed_space = false
      position = @rectangles.rindex(@active_rectangle)
      if position < @rectangles.size-1
        make_active(@rectangles[position+1])
      else
        make_active(@rectangles[0])
      end
    end
  end

  def make_active(this_rectangle)
    @rectangles.each do |rectangle| 
      if rectangle.object_id == this_rectangle.object_id
        rectangle.active = true
        @active_rectangle = rectangle
      else
        rectangle.active = false
      end
    end
  end
end
