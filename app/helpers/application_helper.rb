module ApplicationHelper
    def bootstrap_class_for flash_type
        case flash_type.to_sym
        when :success
            "alert-success"
        when :error
            "alert-danger"
        when :alert
            "alert-info"
        when :notice
            "alert-info"
        else
            "alert-info"
        end
    end
end
