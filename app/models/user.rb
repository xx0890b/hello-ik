class User < ApplicationRecord
    has_many:messages
    def get_user_id_by_name(name)
        begin
            user = User.find_by!(name: name)
            # status = true
        rescue => exception
            # status = false
        end
        return user.id
    end

    def get_message_by_date_time(date_time)

        begin
            message = self.messages.find_by!('created_at like ?' ,date_time +'%')
            status = true
        rescue => exception
            status = false
        end
        return status,message
    end
end
