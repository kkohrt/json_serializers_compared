require 'oj' # you can skip this if OJ has already been required.

Blueprinter.configure do |config|
  config.generator = Oj # default is JSON
  config.datetime_format = ->(datetime) { case datetime; when NilClass, Date then datetime; else datetime.strftime("%FT%H:%M:%SZ"); end }
end

