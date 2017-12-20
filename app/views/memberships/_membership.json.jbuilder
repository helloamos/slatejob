json.extract! membership, :id, :start_date, :end_date, :package_id, :total_bid, :status, :created_at, :updated_at
json.url membership_url(membership, format: :json)
