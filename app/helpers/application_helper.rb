module ApplicationHelper

  def full_title(page_title = '')
    base_title = "Original Piano App"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def room
    binding.pry
    @user = User.find(current_user.id)
    @currentUserEntry = Entry.where(user_id: current_user.id)
    @adminuser = Entry.where(user_id: 1)
    @currentUserEntry.each do |cu|
      @adminuser.each do |ad|
        if cu.room_id == ad.room_id then
          @roomId = cu.room_id
        end
      end
    end

  end


end
