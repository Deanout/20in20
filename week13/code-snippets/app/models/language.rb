class Language < ApplicationRecord
    has_many :snippets, dependent: :destroy
end
