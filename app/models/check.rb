class Check < ActiveRecord::Base
  belongs_to :client
    enum status_check: [:carteira,:transferido,:devolvido,:diversos]
    def method_name

    end
end
