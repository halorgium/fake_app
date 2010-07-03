app = lambda do |env|
  [200, {"Content-Type" => "text/plain"}, ["winner fail"]]
end

run app
