# encoding: utf-8
# IMPORTANT: This file was generated.
# Edit at your own peril - it's recommended to regenerate this file
# in the future when you upgrade to a newer version of Cucumber.
# Consider adding your own code to a new file instead of editing this one.

require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

# Commonly used webrat steps
# http://github.com/brynary/webrat

Dado /^que eu esteja na (.+)$/ do |page_name|
  visit path_to(page_name)
end

Quando /^eu vou para (.+)$/ do |page_name|
  visit path_to(page_name)
end

Quando /^eu aperto "([^\"]*)"$/ do |button|
  click_button(button)
end

Quando /^eu clico "([^\"]*)"$/ do |link|
  click_link(link)
end

Quando /^eu clico "([^\"]*)" dentro de "([^\"]*)"$/ do |link, parent|
  click_link_within(parent, link)
end

Quando /^eu preencho "([^\"]*)" com "([^\"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end

Quando /^eu preencho "([^\"]*)" para "([^\"]*)"$/ do |value, field|
  fill_in(field, :with => value)
end

# Use this to fill in an entire form with data from a table. Example:
#
#   When I fill in the following:
#     | Account Number | 5002       |
#     | Expiry date    | 2009-11-01 |
#     | Note           | Nice guy   |
#     | Wants Email?   |            |
#
# TODO: Add support for checkbox, select og option
# based on naming conventions.

Quando /^eu preencho o seguinte:$/ do |fields|
  fields.rows_hash.each do |name, value|
    Quando %{eu preencho "#{name}" com "#{value}"}
  end
end

Quando /^eu seleciono "([^\"]*)" de "([^\"]*)"$/ do |value, field|
  select(value, :from => field)
end

Quando /^eu seleciono "([^\"]*)" como a data e a hora$/ do |time|
  select_datetime(time)
end

# Use this step when using multiple datetime_select helpers on a page or
# you want to specify which datetime to select. Given the following view:
#   <%= f.label :preferred %><br />
#   <%= f.datetime_select :preferred %>
#   <%= f.label :alternative %><br />
#   <%= f.datetime_select :alternative %>
# The following steps would fill out the form:
# When I select "November 23, 2004 11:20" as the "Preferred" date and time
# And I select "November 25, 2004 10:30" as the "Alternative" date and time
Quando /^eu seleciono "([^\"]*)" como a data e a hora "([^\"]*)"$/ do |datetime, datetime_label|
  select_datetime(datetime, :from => datetime_label)
end

# Use this step in conjunction with Rail's time_select helper. For example:
# When I select "2:20PM" as the time
# Note: Rail's default time helper provides 24-hour time-- not 12 hour time. Webrat
# will convert the 2:20PM to 14:20 and then select it.
Quando /^eu seleciono "([^\"]*)" como a hora$/ do |time|
  select_time(time)
end

# Use this step when using multiple time_select helpers on a page or you want to
# specify the name of the time on the form.  For example:
# When I select "7:30AM" as the "Gym" time
Quando /^eu seleciono "([^\"]*)" como a hora "([^\"]*)"$/ do |time, time_label|
  select_time(time, :from => time_label)
end

# Use this step in conjunction with Rail's date_select helper.  For example:
# When I select "February 20, 1981" as the date
Quando /^eu seleciono "([^\"]*)" como a data$/ do |date|
  select_date(date)
end

# Use this step when using multiple date_select helpers on one page or
# you want to specify the name of the date on the form. For example:
# When I select "April 26, 1982" as the "Date of Birth" date
Quando /^eu seleciono "([^\"]*)" como a data "([^\"]*)"$/ do |date, date_label|
  select_date(date, :from => date_label)
end

#alternativo, sem "a data"
Quando /^eu seleciono "([^\"]*)" como "([^\"]*)"$/ do |date, date_label|
  select_date(date, :from => date_label)
end

Quando /^eu marco "([^\"]*)"$/ do |field|
  check(field)
end

Quando /^eu desmarco "([^\"]*)"$/ do |field|
  uncheck(field)
end

Quando /^eu escolho "([^\"]*)"$/ do |field|
  choose(field)
end

Quando /^eu anexo o arquivo em "([^\"]*)" a "([^\"]*)"$/ do |path, field|
  attach_file(field, path)
end

Então /^eu devo ver "([^\"]*)"$/ do |text|
<% if framework == :rspec -%>
  response.should contain(text)
<% else -%>
  assert_contain text
<% end -%>
end

Então /^eu devo ver "([^\"]*)" dentro de "([^\"]*)"$/ do |text, selector|
  within(selector) do |content|
<% if framework == :rspec -%>
    content.should contain(text)
<% else -%>
    assert content.include?(text)
<% end -%>
  end
end

Então /^eu devo ver \/([^\/]*)\/$/ do |regexp|
  regexp = Regexp.new(regexp)
<% if framework == :rspec -%>
  response.should contain(regexp)
<% else -%>
  assert_contain regexp
<% end -%>
end

Então /^eu devo ver \/([^\/]*)\/ dentro de "([^\"]*)"$/ do |regexp, selector|
  within(selector) do |content|
    regexp = Regexp.new(regexp)
<% if framework == :rspec -%>
    content.should contain(regexp)
<% else -%>
    assert content =~ regexp
<% end -%>
  end
end

Então /^eu não devo ver "([^\"]*)"$/ do |text|
<% if framework == :rspec -%>
  response.should_not contain(text)
<% else -%>
  assert_not_contain text
<% end -%>
end

Então /^eu não devo ver "([^\"]*)" dentro de "([^\"]*)"$/ do |text, selector|
  within(selector) do |content|
<% if framework == :rspec -%>
    content.should_not contain(text)
<% else -%>
    assert !content.include?(text)
<% end -%>
  end
end

Então /^eu não devo ver \/([^\/]*)\/$/ do |regexp|
  regexp = Regexp.new(regexp)
<% if framework == :rspec -%>
  response.should_not contain(regexp)
<% else -%>
  assert_not_contain regexp
<% end -%>
end

Então /^eu não devo ver \/([^\/]*)\/ dentro de "([^\"]*)"$/ do |regexp, selector|
  within(selector) do |content|
    regexp = Regexp.new(regexp)
<% if framework == :rspec -%>
    content.should_not contain(regexp)
<% else -%>
    assert content !~ regexp
<% end -%>
  end
end

Então /^o campo "([^\"]*)" deve conter "([^\"]*)"$/ do |field, value|
<% if framework == :rspec -%>
  field_labeled(field).value.should =~ /#{value}/
<% else -%>
  assert_match(/#{value}/, field_labeled(field).value)
<% end -%>
end

Então /^o campo "([^\"]*)" não deve conter "([^\"]*)"$/ do |field, value|
<% if framework == :rspec -%>
  field_labeled(field).value.should_not =~ /#{value}/
<% else -%>
  assert_no_match(/#{value}/, field_labeled(field).value)
<% end -%>
end

Então /^o checkbox "([^\"]*)" deve estar marcado$/ do |label|
<% if framework == :rspec -%>
  field_labeled(label).should be_checked
<% else -%>
  assert field_labeled(label).checked?
<% end -%>
end

Então /^o checkbox "([^\"]*)" não deve estar marcado$/ do |label|
<% if framework == :rspec -%>
  field_labeled(label).should_not be_checked
<% else -%>
  assert !field_labeled(label).checked?
<% end -%>
end

Então /^eu devo estar na (.+)$/ do |page_name|
<% if framework == :rspec -%>
  URI.parse(current_url).path.should == path_to(page_name)
<% else -%>
  assert_equal path_to(page_name), URI.parse(current_url).path
<% end -%>
end

Então /^mostre-me a página$/ do
  save_and_open_page
end