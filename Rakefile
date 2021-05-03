# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative "config/application"
require 'securerandom'

Rails.application.load_tasks

namespace :json do
  task benchmark: :environment do
    test_person = Person.includes(:organization, :addresses, :phones, comments: :commentable).last
    puts '=' * 100
    puts "Testing #{test_person.first_name} #{test_person.last_name}"
    puts '=' * 100

    alba = Proc.new { AlbaPersonDetail.new(test_person).serialize }
    blueprinter = Proc.new { PersonBlueprint.render(test_person, view: :comments, root: :person) }
    jsonapi = proc { PersonDetailSerializer.new(test_person).to_json }

    json_run_benchmark(alba, blueprinter, jsonapi, 'person_last')


    test_person = Person.includes(:organization, :addresses, :phones, comments: :commentable).first
    puts '=' * 100
    puts "Testing #{test_person.first_name} #{test_person.last_name}"
    puts '=' * 100

    alba = Proc.new { AlbaPersonDetail.new(test_person).serialize }
    blueprinter = Proc.new { PersonBlueprint.render(test_person, view: :comments, root: :person) }
    jsonapi = proc { PersonDetailSerializer.new(test_person).to_json }

    json_run_benchmark(alba, blueprinter, jsonapi, 'person_first')


    test_org = Organization.includes(:people, :addresses, :phones, comments: :commentable).first
    puts '=' * 100
    puts "Testing Org: #{test_org.name_displayed}"
    puts '=' * 100

    alba = Proc.new { AlbaOrganizationDetail.new(test_org).serialize }
    blueprinter = Proc.new { OrganizationBlueprint.render(test_org, view: :the_works, root: :organization) }
    jsonapi = proc { OrganizationDetailSerializer.new(test_org).to_json }

    json_run_benchmark(alba, blueprinter, jsonapi, 'org')

  end


  task populate: :environment do
    people = []
    4.times do |o|
      org = json_test_org
      3.times { json_test_phone(org) }
      5.times { json_test_address(org) }
      40.times do
        person = json_test_person(org)
        json_test_phone(person)
        json_test_address(person)
        people << person
      end
      30.times do
        json_test_comment_chain(org, people)
      end
    end
  end
end

def json_clean_thing(thing)
  case thing
  when Hash
    json_sort_hash(thing)
  when Array
    json_sort_array(thing)
  else
    thing
  end
end

def json_sort_array(array)
  array.sort_by do |obj|
    if obj.is_a?(Hash) && obj.key?('id')
      obj['id']
    else
      obj.object_id
    end
  end.map do |elem|
    case elem
    when Hash
      json_sort_hash(elem)
    when Array
      json_sort_array(elem)
    else
      elem
    end
  end
end

def json_sort_hash(misc_hash)
  misc_hash.keys.sort.each_with_object({}) do |key, new_hash|
    value = misc_hash[key]
    case value
    when Hash
      new_hash[key] = json_sort_hash(value)
    when Array
      new_hash[key] = json_sort_array(value)
    else
      new_hash[key] = value
    end
  end
end

def json_run_benchmark( alba, blueprinter, jsonapi, ext)
      puts "Serializer outputs ----------------------------------"
    {
      alba: alba,
      # alba_inline: alba_inline,
      # ams: ams,
      blueprinter: blueprinter,
      # jbuilder: jbuilder, # different order
      jsonapi: jsonapi # nested JSON:API format
      # jsonapi_same_format: jsonapi_same_format,
      # rails: rails,
      # representable: representable
    }.each do |name, serializer|
      output = JSON.pretty_generate(json_clean_thing(JSON(serializer.call)))
      filename = "#{name}_#{ext}_output.json"
      puts "#{name.to_s.ljust(24, ' ')} #{output.length} chars (see #{filename})"
      File.open(filename, 'w') { |f| f.puts output }
    end


    require 'benchmark'
    time = 1000
    Benchmark.bmbm do |x|
      x.report(:alba) { time.times(&alba) }
      # x.report(:alba_inline) { time.times(&alba_inline) }
      # x.report(:ams) { time.times(&ams) }
      x.report(:blueprinter) { time.times(&blueprinter) }
      # x.report(:jbuilder) { time.times(&jbuilder) }
      x.report(:jsonapi) { time.times(&jsonapi) }
      # x.report(:jsonapi_same_format) { time.times(&jsonapi_same_format) }
      # x.report(:rails) { time.times(&rails) }
      # x.report(:representable) { time.times(&representable) }
    end

    require 'benchmark/ips'
    Benchmark.ips do |x|
      x.report(:alba, &alba)
      # x.report(:alba_inline, &alba_inline)
      # x.report(:ams, &ams)
      x.report(:blueprinter, &blueprinter)
      # x.report(:jbuilder, &jbuilder)
      x.report(:jsonapi, &jsonapi)
      # x.report(:jsonapi_same_format, &jsonapi_same_format)
      # x.report(:rails, &rails)
      # x.report(:representable, &representable)

      x.compare!
    end
  end

def json_test_org
  Organization.create(
    name_internal: Faker::Company.name,
    name_displayed: Faker::Company.name,
    ukey: SecureRandom.alphanumeric(30),
    description: Faker::Lorem.sentences(number: 5).join(' ')
  )
end

def json_test_person(org)
  org.people.create(
    annual_income: rand(10_000_000)/100.0,
    birth_date: rand(100).years.ago + rand(11).months + rand(30.days),
    email: Faker::Internet.email,
    favorite_color: Faker::Color.color_name,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    string: Faker::Lorem.sentences(number: 3).join(' ')
  )
end

def json_test_phone(phonable)
  phonable.phones.create(
    can_call: rand(10) > 5,
    can_text: rand(10) > 5,
    classification: %w(iphone mobile landline fax).sample,
    disabled_at: rand(10) > 7 ? rand(1000).days.ago : nil,
    extension: Faker::PhoneNumber.extension,
    nickname: Faker::Name.first_name,
    number: Faker::PhoneNumber.phone_number,
    priority: rand(100),
    shared: rand(10) > 5
  )
end

def json_test_address(addressable)
  addressable.addresses.create(
    city: Faker::Address.city,
    deleted_at: rand(10) > 8 ? rand(1000).days.ago : nil,
    postal_code: Faker::Address.zip,
    state_or_region: Faker::Address.state,
    street1: Faker::Address.street_address,
    street2: Faker::Address.secondary_address
  )
end

def json_test_comment(person, commentable)
  person.comments.create(
    comment: Faker::Lorem.sentences(number: 5).join(' '),
    reviewed: rand(10) > 5,
    commentable: commentable
  )
end

def json_test_comment_chain(org, people)
  comments = [json_test_comment(people.sample, org)]
  30.times do
    comments << json_test_comment(people.sample, comments.sample)
  end
end
