class User < ApplicationRecord
    has_many:messages

    def get_message_by_date_time(date_time)
        date_time = date_time.strftime("%Y-%m-%d %H:%M:%S")
        message = self.messages.find_by!('created_at like ?' ,date_time +'%')
        return message
    end
end
