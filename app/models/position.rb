class Position < ApplicationRecord
    has_many :candidates, :dependent => :destroy
end
