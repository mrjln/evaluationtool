# README
Evaluation Tool for Teachers to evaluate students

### more information
This tool enables teacher to provide an evaluation for students every day: red, yellow or green.
Teacher can leave a comment on every evaluation.

Algorithm:
In addition this tool uses an algorithm that selects a student semi-randomly, to ask them a question:

red students: 50% chance of getting selected
yellow students: 33% chance of getting selected
green students: 17% chance of getting selected

Overall goal: more attention for students that need extra some extra help with learning.  


## Database Structure

1. Batches
  * number:integer
  * starts_at:date
  * ends_at:date
  * has_many :students

2. Students
  * name:string
  * belongs_to:batch
  * has_many: photos

3. Evaluation
  * color:string
  * evaluation_date:date
  * belongs_to :student
  * has many :comments

4. Comments
  * content:text
  * belongs_to :user
  * belongs_to :evaluation

5. Photos
  * image:string
  * belongs_to : student

6. Users  
 see gem: device ^4.2 https://github.com/plataformatec/devise

## Images
Using Cloudinary and Carrierwave.
* [CarrierWave](https://github.com/carrierwaveuploader/carrierwave)
* [Cloudinary](http://cloudinary.com/documentation/rails_integration#getting_started_guide)

## Running Locally

Make sure you have [Ruby](https://www.ruby-lang.org/en/) and [Bundler](http://bundler.io/) installed.

```bash
git clone [url]
cd evaluationtool
bundle install
rake db:create db:migrate db:seed
rails server
```

## Testsuite

* [RSpec](http://rspec.info/)
* [Capybara](https://github.com/teamcapybara/capybara)
