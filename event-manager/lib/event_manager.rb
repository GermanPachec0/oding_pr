require 'csv'
require 'google/apis/civicinfo_v2'
require 'erb'
require 'date'

def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5, '0')[0..4]
end

def clean_phone_numbers(number)
  sanitize_number = number.gsub(/[^\d]/, '')
  if sanitize_number.length < 10
    'invalid_format'
  elsif sanitize_number.length == 11 && sanitize_number[0] == '1'
    sanitize_number[1..10]
  elsif sanitize_number.length >= 11
    'invalid_format'
  else
    sanitize_number
  end
end

def legislators_by_zipcode(zip)
  civic_info = Google::Apis::CivicinfoV2::CivicInfoService.new
  civic_info.key = 'AIzaSyClRzDqDh5MsXwnCWi0kOiiBivP6JsSyBw'

  begin
    civic_info.representative_info_by_address(
      address: zip,
      levels: 'country',
      roles: %w[legislatorUpperBody legislatorLowerBody]
    ).officials
  rescue StandardError
    'You can find your representatives by visiting www.commoncause.org/take-action/find-elected-officials'
  end
end

def save_thank_you_letter(id, form_letter)
  Dir.mkdir('output') unless Dir.exist?('output')

  filename = "output/thakns_#{id}.html"

  File.open(filename, 'w') do |file|
    file.puts form_letter
  end

  puts form_letter
end

contents = CSV.open(
  'event_attendees.csv',
  headers: true,
  header_converters: :symbol
)

puts 'EventManager initialized.'
template_letter = File.read('form_letter.erb')
erb_template = ERB.new template_letter
hours_counter = Hash.new(0)
contents.each do |row|
  datetime_str = row[:reg_date].to_s
  datetime_obj = DateTime.strptime(datetime_str, '%m/%y/%m %H:%M')
  hour = datetime_obj.hour
  hours_counter[hour] += 1
end
a =  hours_counter.sort_by { |_k, v| v }.reverse
a.each do |value|
  puts "HOUR #{value[0]} QUANTITY #{value[1]}"
end

# santinize phone numbers
# contents.each do |row|
#   phone = clean_phone_numbers(row[5])
#   puts phone
# end

# contents.each do |row|
#   id = row[0]

#   name = row[:first_name]

#   zipcode = clean_zipcode(row[:zipcode])

#   legislators = legislators_by_zipcode(zipcode)

#   form_letter = erb_template.result(binding)

#   save_thank_you_letter(id, form_letter)
# end
