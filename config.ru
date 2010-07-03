app = lambda do |env|
  [200, {"Content-Type" => "text/plain"}, ["winner 2"]]
end

run app
