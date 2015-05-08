class CompletedSurvey < ActiveRecord::Base
 belongs_to :taker, {class_name: "User"}
end
