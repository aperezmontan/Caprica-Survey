mildred = User.create(name: "Mildred", email: "mildred@mildred.com", password: 123)
vinny = User.create(name: "Vinny", email: "Vinny@Vinny.com", password: 123)
betty = User.create(name: "Betty", email: "betty@betty.com", password: 123)
alison = User.create(name: "alison", email: "alison@alison.com", password: 123)
jeffery = User.create(name: "jeffery", email: "jeffery@jeffery.com", password: 123)



icecream = Survey.create(title: "I scream, U scream, we all scream for ICE CREAM", creator_id: 2)
nintiestvshows = Survey.create(title: "Nineties TV Shows", creator_id: 1)


icecream1 = Question.create(description: "What is your favorite ice cream flavor?", survey_id: 1)
  icecream11 = Answer.create(description: "Chocolate", question_id: 1)
  icecream12 = Answer.create(description: "Vanilla", question_id: 1)
  icecream13 = Answer.create(description: "Mint Chocolate Chip", question_id: 1)
  icecream14 = Answer.create(description: "Pistachio", question_id: 1)
icecream2 = Question.create(description: "What is your favorite ice cream topping?", survey_id: 1)
  icecream21 = Answer.create(description: "Peanuts", question_id: 2)
  icecream22 = Answer.create(description: "Chocolate Chips", question_id: 2)
  icecream23 = Answer.create(description: "Caramel", question_id: 2)
  icecream24 = Answer.create(description: "Chocolate Sauce", question_id: 2)
icecream3 = Question.create(description: "What is your favorite ice cream container?", survey_id: 1)
  icecream31 = Answer.create(description: "Cone", question_id: 3)
  icecream32 = Answer.create(description: "Waffle cone", question_id: 3)
  icecream33 = Answer.create(description: "Dish", question_id: 3)
  icecream34 = Answer.create(description: "Chocolate waffle cone", question_id: 3)


nineties4 = Question.create(description:"What was your favorite 90's cartoon?", survey_id: 2)
  nineties41 = Answer.create(description: "Hey Arnold", question_id: 4)
  nineties42 = Answer.create(description: "Doug Funny", question_id: 4)
  nineties43 = Answer.create(description: "Ren & Stimpy", question_id: 4)
  nineties44 = Answer.create(description: "Rugrats", question_id: 4)
nineties5 = Question.create(description:"What was your favorite 90's drama?", survey_id: 2)
  nineties51 = Answer.create(description: "ER", question_id: 5)
  nineties52 = Answer.create(description: "X Files", question_id: 5)
  nineties53 = Answer.create(description: "Dawson's Creek", question_id: 5)
  nineties54 = Answer.create(description: "Beverly Hills 90210", question_id: 5)
nineties6 = Question.create(description:"What was your favorite 90's reality show?", survey_id: 2)
  nineties61 = Answer.create(description: "Cops", question_id: 6)
  nineties62 = Answer.create(description: "The Real World", question_id: 6)
  nineties63 = Answer.create(description: "America's Funniest Home Videos", question_id: 6)
  nineties64 = Answer.create(description: "True Life", question_id: 6)

test = CompletedSurvey.create(survey_id: 2, answer_id: 14, taker_id: 2)
test2 = CompletedSurvey.create(survey_id: 2, answer_id: 19, taker_id: 2)
test3 = CompletedSurvey.create(survey_id: 2, answer_id: 22, taker_id: 2)

test4 = CompletedSurvey.create(survey_id: 2, answer_id: 13, taker_id: 3)
test5 = CompletedSurvey.create(survey_id: 2, answer_id: 19, taker_id: 3)
test6 = CompletedSurvey.create(survey_id: 2, answer_id: 24, taker_id: 3)

test7 = CompletedSurvey.create(survey_id: 2, answer_id: 13, taker_id: 4)
test8 = CompletedSurvey.create(survey_id: 2, answer_id: 18, taker_id: 4)
test9 = CompletedSurvey.create(survey_id: 2, answer_id: 22, taker_id: 4)

test10 = CompletedSurvey.create(survey_id: 2, answer_id: 15, taker_id: 5)
test11 = CompletedSurvey.create(survey_id: 2, answer_id: 17, taker_id: 5)
test12 = CompletedSurvey.create(survey_id: 2, answer_id: 22, taker_id: 5)
