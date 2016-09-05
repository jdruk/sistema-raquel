class Check < ActiveRecord::Base
    belongs_to :client

    validates :bank, presence: true
    validates :agency, presence: true
    validates :account, presence: true
    validates :holder, presence: true
    validates :value_check, presence: true

    enum status_check: [:carteira,:transferido,:devolvido,:diversos]

    def self.status_check_group type
        value = Check.value_check_geral type
        unless value.nil?
            return value
        end
        return 0.0
    end

    def self.value_check_geral type
        value = Check.group(:status_check).sum(:value_check)
        value[type]
    end

    def self.type_check type
        Check.where status_check: type
    end
end
