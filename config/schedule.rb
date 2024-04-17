# frozen_string_literal: true

every :hour do
  rake "backup"
end
