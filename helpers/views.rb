module Views 
  def format_time(time)
    time.strftime("%m/%d/%y at %l:%M %P")
  end
end
