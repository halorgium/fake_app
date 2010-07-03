app = lambda do |env|
  [200, {"Content-Type" => "text/plain"}, ["winner FAIL"]]
end

run app
