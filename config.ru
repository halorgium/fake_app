app = lambda do |env|
  [200, {"Content-Type" => "text/plain"}, ["winner"]]
end

run app
