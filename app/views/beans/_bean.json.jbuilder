json.extract! bean, :id, :name, :description, :roast, :created_at, :updated_at
json.url bean_url(bean, format: :json)