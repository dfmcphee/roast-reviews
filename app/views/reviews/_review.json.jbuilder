json.extract! review, :id, :notes, :roast, :sour, :sweet, :bitter, :salty, :rating, :created_at, :updated_at
json.url review_url(review, format: :json)