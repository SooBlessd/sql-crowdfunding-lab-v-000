# Write your sql queries in this file in the appropriate method like the example below:
#
# def select_category_from_projects
# "SELECT category FROM projects;"
# end

# Make sure each ruby method returns a string containing a valid SQL statement.

def selects_the_titles_of_all_projects_and_their_pledge_amounts_alphabetized_by_title
  "SELECT projects.title, SUM(pledges.amount) FROM projects JOIN pledges ON projects.id = pledges.project_id GROUP BY projects.title;"
end

def selects_the_user_name_age_and_pledge_amount_for_all_pledge_alphabetized_by_name
  "SELECT users.name, users.age, SUM(pledges.amount) FROM users JOIN pledges ON users.id = pledges.user_id GROUP BY users.name"
end

def selects_the_titles_and_amount_over_goal_of_all_projects_that_have_met_their_funding_goal
  # "SELECT projects.title, (projects.funding_goal - SUM(pledges.amount)) AS amount_left FROM projects JOIN pledges ON projects.id = pledges.project_id GROUP BY projects.title HAVING amount_left <= 0;"
  # find the title, find the goal, subtract the pledge amount from project goal if 0 return
  "SELECT projects.title, (projects.funding_goal - SUM(pledges.amount)) AS amount_left FROM projects JOIN pledges ON projects.id = pledges.project_id GROUP BY projects.title HAVING amount_left <= 0;"
end

def selects_user_names_and_amounts_of_all_pledge_grouped_by_name_then_orders_them_by_the_summed_amount
  "SELECT users.name, SUM(pledges.amount) AS total_pledged FROM users JOIN pledges ON users.id = pledges.user_id GROUP BY users.name ORDER BY total_pledged"
  # find username, find sum of all pledges, then join, group by name, order by sum amount (store the sum)
end

def selects_the_category_names_and_pledge_amounts_of_all_pledge_in_the_music_category
  "SELECT projects.category, pledges.amount FROM projects JOIN pledges ON projects.id = pledges.project_id WHERE projects.category = 'music';"
  # find category name, find pledge amount, when category is music 
end

def selects_the_category_name_and_the_sum_total_of_the_all_its_pledge_for_the_books_category
  "SELECT projects.category, SUM(pledges.amount) FROM projects JOIN pledges ON projects.id = pledges.project_id WHERE projects.category = 'books'; "
  #find category, find sum of pledges.amounts, when category is book 
end
