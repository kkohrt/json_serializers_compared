# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative "config/application"
require 'securerandom'

Rails.application.load_tasks

namespace :json do
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
