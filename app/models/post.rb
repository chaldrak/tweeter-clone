class Post < ApplicationRecord
    validates :content, length: {in: 1..140, message: " doit comporter entre 1 et 140 caractères"}
end
