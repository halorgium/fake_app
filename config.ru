app = lambda do |env|
  [200, {"Content-Type" => "text/plain"}, ["winner 42"]]
end

run app
