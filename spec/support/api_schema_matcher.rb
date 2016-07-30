RSpec::Matchers.define :match_response_schema do |schema|
  match do |serialized_object|
    schema_directory = "#{Dir.pwd}/spec/support/api/schemas"
    schema_path = "#{schema_directory}/#{schema}.json"
    JSON::Validator.validate!(schema_path, serialized_object, strict: true)
  end
end
